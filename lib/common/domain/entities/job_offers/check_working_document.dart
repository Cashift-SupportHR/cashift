
import '../shift/check_working_document_dto.dart';

class CheckWorkingDocument {
  final String? icon;
  final String ?description;
  final String ?notes;

  CheckWorkingDocument({ this.icon,  this.description,  this.notes});

   factory CheckWorkingDocument.fromDto(CheckWorkingDocumentDto json){
      return CheckWorkingDocument(
        icon: json.icon,
        description: json.decription,
        notes: json.notes
      );
   }
}

