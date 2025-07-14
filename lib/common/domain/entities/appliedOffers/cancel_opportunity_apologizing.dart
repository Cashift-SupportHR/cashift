
import '../shift/index_shift.dart';

class CancelOpportunityApologizing {
  String? icon;
  String? title;
  String? attentionMessage;
  bool? attentionMessageStatus;
  List<Term>? terms;

  CancelOpportunityApologizing({this.icon, this.title, this.attentionMessage, this.attentionMessageStatus, this.terms});

   factory CancelOpportunityApologizing.fromDto(CancelOpportunityApologizingDto json) {
     return CancelOpportunityApologizing(
        icon: json.icon,
        title: json.title,
        attentionMessage: json.attentionMessage,
        attentionMessageStatus: json.attentionMessageStatus,
        terms: json.terms
     );
   }
}