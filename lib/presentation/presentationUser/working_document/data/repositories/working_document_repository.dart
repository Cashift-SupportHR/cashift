import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/data/models/installment_with_cashift_dto.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/data/models/working_document_dto.dart';

import '../datasource/working_document_provider.dart';
import '../models/term_condition_certificate_payment_dto.dart';


@injectable
class WorkingDocumentRepository {

  final WorkingDocumentAPI _api;

  WorkingDocumentRepository(this._api);


  Future<WorkingDocumentDto> fetchWorkingDocumentData(int jobId) async {
    final response = await _api.fetchWorkingDocumentData(jobId);
    return response.payload!;
  }

  Future<List<InstallmentWithCashiftDto>> fetchInstallmentWithCashiftData(int certificateId) async {
    final response = await _api.fetchInstallmentWithCashiftData(certificateId);
    return response.payload!;
  }

  Future<ApiResponse<String>> addInstallmentWithCashift(int installmentId) async {
    final response = await _api.addInstallmentWithCashift(installmentId);
    return response;
  }

  Future<List<TermConditionCertificatePaymentDto>> fetchTermsConditionsCertificatePayment(int paymentId) async {
    final response = await _api.fetchTermsConditionsCertificatePayment(paymentId);
    return response.payload!;
  }

  Future<ApiResponse<String>> saveInstallmentPostponement({int? paymentId, String? description}) async {
    final response = await _api.saveInstallmentPostponement(paymentId, description);
    return response;
  }
}
