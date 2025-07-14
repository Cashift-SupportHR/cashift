import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/datasources/remote/api/terms/terms_api_provider.dart';
import 'package:shiftapp/common/domain/entities/terms/terms_item.dart';
@Injectable()
class TermsRepository {

  final TermsAPI api;

  TermsRepository(this.api);

  Future<List<TermsItem>> fetchPublicTermsAndCondition() async {
    final response = await api.fetchPublicTermsAndCondition();
    return response.payload!;
  }


}
