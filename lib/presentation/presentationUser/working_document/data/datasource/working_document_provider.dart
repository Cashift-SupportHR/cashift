
import 'package:injectable/injectable.dart';

import '../../../../../common/data/models/api_response.dart';
import '../../../../../common/network/source/user_endpoint.dart';
import '../models/installment_with_cashift_dto.dart';
import '../models/term_condition_certificate_payment_dto.dart';
import '../models/working_document_dto.dart';

@Injectable()
class WorkingDocumentAPI {
  final UserEndpoint api;

  WorkingDocumentAPI(this.api);

  Future<ApiResponse<WorkingDocumentDto>> fetchWorkingDocumentData(int JobId) async {
    return await api.fetchWorkingDocumentData(JobId);
  }

  Future<ApiResponse<List<InstallmentWithCashiftDto>>> fetchInstallmentWithCashiftData(int paymentId) async {
    return await api.fetchInstallmentWithCashiftData(paymentId);
  }

  Future<ApiResponse<String>> addInstallmentWithCashift(int InstallmentId) async {
    return await api.addInstallmentWithCashift(InstallmentId);
  }

  Future<ApiResponse<List<TermConditionCertificatePaymentDto>>> fetchTermsConditionsCertificatePayment(int paymentId) async {
    return await api.fetchTermsConditionsCertificatePayment(paymentId);
  }

  Future<ApiResponse<String>> saveInstallmentPostponement(int? paymentId,String? description) async{
    return await api.saveInstallmentPostponement(paymentId, description);
  }

}
