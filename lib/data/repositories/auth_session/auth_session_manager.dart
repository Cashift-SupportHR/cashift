import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/data/datasources/remote/api/auth/auth_api_provider.dart';
import 'package:shiftapp/data/models/auth/refresh_token_params.dart';
import 'package:shiftapp/data/repositories/user/user_repository.dart';

import '../../../presentation/adminFeatures/di/injector.dart';

/// Coordinates access-token refresh using the stored refresh token.
///
/// - Deduplicates concurrent refresh calls.
/// - Persists the refreshed [User] into [UserRepository] on success.
/// - Clears user session on unrecoverable refresh failures.
@Injectable()
@LazySingleton()
class AuthSessionManager {
  // final AuthAPI authApi;
  // final UserRepository userRepository;

  Future<bool>? _refreshInFlight;

  AuthSessionManager();


  bool _isRefreshTokenDefinitelyInvalid() {
    UserRepository userRepository = getIt.get<UserRepository>();
    // If backend provides refreshTokenExpiresAt, use it. Otherwise, be optimistic.
    if (userRepository.isRefreshTokenExpired()) return true;
    final rt = userRepository.getRefreshToken();
    return rt.isEmpty;
  }

  /// Refresh the session if possible.
  ///
  /// Returns true if refresh succeeded and tokens were updated.
  Future<bool> refresh() {
    AuthAPI authApi = getIt.get<AuthAPI>();
    UserRepository userRepository = getIt.get<UserRepository>();
    // Deduplicate concurrent refresh calls.
    final existing = _refreshInFlight;
    if (existing != null) return existing;

    final completer = Completer<bool>();
    _refreshInFlight = completer.future;

    () async {
      try {
        if (_isRefreshTokenDefinitelyInvalid()) {
          completer.complete(false);
          return;
        }

        final refreshToken = userRepository.getRefreshToken();
        final response = await authApi.refreshToken(
          RefreshTokenParams(refreshToken: refreshToken),
        );

        if (response.isSuccessfully() && response.payload != null) {
          userRepository.saveUser(response.payload!);
          completer.complete(true);
        } else {
          // Server refused refresh: treat as session invalid.
          userRepository.clearUser();
          completer.complete(false);
        }
      } catch (_) {
        // Network/other errors: do not force logout, just fail refresh.
        completer.complete(false);
      } finally {
        _refreshInFlight = null;
      }
    }();

    return completer.future;
  }
}
