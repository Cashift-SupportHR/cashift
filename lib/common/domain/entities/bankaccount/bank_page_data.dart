import 'package:shiftapp/common/domain/entities/bankaccount/bank.dart';

class BankPageData {
  final List<Bank> bankList;
  final List<String> disclosure;

  BankPageData({required this.bankList,required this.disclosure});
}