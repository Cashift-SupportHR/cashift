import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';

import '../../../../../common/data/datasources/remote/unauthorized_exception.dart';
import '../../../../../common/data/exceptions/verification_face_exception.dart';
import '../../../../../common/data/repositories/user/user_repository.dart';
import '../../../../presentationUser/common/common_state.dart';
import '../../data/models/index.dart';
import '../../domain/entities/index.dart';

@Injectable()
class AdminWalletCubit extends BaseCubit {
  final AdminWalletRepository repository;
  final UserRepository userRepository;

  AdminWalletCubit(this.repository, this.userRepository);

  StreamStateInitial<WalletBalance> walletBalanceStream = StreamStateInitial();

  int _page = -1;
  List<DepositAdminWallet> deposit = [];
  List<DepositAdminWallet> allDeposit = [];
  List<PendingPayedAdminWallet> pendingPayed = [];
  List<PendingPayedAdminWallet> allPendingPayed = [];

  AdminWalletPrams params = AdminWalletPrams(pageNumber: 1, filterId: 0, tabId: 1, pageSize: 10);

  StreamState<AdminWallet?> walletDataStream = StreamStateInitial();

  fetchWalletBalanceStream() async {
    try {
      if (userRepository.isNotLoggedIn()) {
        emit(ErrorState(UnAuthorizedException()));
        return;
      }
      final result = await repository.fetchWalletBalance();
      final data = WalletBalance.fromDto(result);
      walletBalanceStream.setData(data);
    } on Exception catch (e) {
      walletBalanceStream.setError(e);
    }
  }

  Future<void> fetchLoadingData({
    String? startDate,
    String? endDate,
    required int filterId,
  }) async {
    executeBuilder(() => repository.fetchTabAndFilter(), onSuccess: (value) async {
      final tabsAndFilter = FilterAndTaps.fromDto(value);

        emit(Initialized<FilterAndTaps>(
        data: tabsAndFilter,
      ));
      fetchWalletDataPagination(tabId: tabsAndFilter.tabs?.first.id ?? 1, isRefresh: true, filterId: filterId, endDate: endDate, startDate: startDate);
    });
  }

  Future<void> fetchWalletDataPagination({bool isRefresh = false, required int tabId, String? startDate, String? endDate, int? filterId}) async {
    deposit = [];
    try {
      if (isRefresh) {
        walletDataStream.setData(null);
        _page = 0;
        deposit = [];
        allDeposit = [];
        pendingPayed = [];
        allPendingPayed = [];
      } else {
        _page++;
      }
      params = AdminWalletPrams(
        pageNumber: _page,
        tabId: tabId,
        startDate: startDate ?? null,
        pageSize: 10,
        endDate: endDate ?? null,
        filterId: filterId ?? 0,
      );
      AdminWallet adminWallet = await fetchWalletData(params);
      deposit = adminWallet.deposit ?? [];
      allDeposit.addAll(deposit);
      pendingPayed = adminWallet.pendingPayed ?? [];
      allPendingPayed.addAll(pendingPayed);
      AdminWallet allWallets = AdminWallet(design: adminWallet.design, deposit: allDeposit, pendingPayed: allPendingPayed);
      walletDataStream.setData(allWallets);
      print("allWallets.length");
    } on Exception catch (e) {
      //    walletDataStream.setError(e);
      if (_page > 0) {
        deposit = [];
        allDeposit.addAll(deposit);
        pendingPayed = [];
        allPendingPayed.addAll(pendingPayed);
        //   emit(ErrorDialogState(e));
      } else {
        walletDataStream.setError(e);
      }
    }
  }

//  change model
  Future<AdminWallet> fetchWalletData(AdminWalletPrams params) async {
    final result = await repository.fetchAdminWalletData(params: params);
    print(result);
    final data = AdminWallet.fromDto(result);
    return data;
  }

  emitVerificationFaceException(){
    emit(ErrorState(VerificationFaceException()));
  }
}
