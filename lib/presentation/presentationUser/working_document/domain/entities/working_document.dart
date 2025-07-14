

import '../../data/models/working_document_dto.dart';

class WorkingDocument {
  List<BenefitDocument>? benefits;
  List<PaymentDocument>? payments;

  WorkingDocument({this.benefits, this.payments});

   factory WorkingDocument.fromDto(WorkingDocumentDto json){
     return WorkingDocument(
       benefits: json.benefits,
       payments: json.payments,
     );
   }
}

