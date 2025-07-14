
import 'package:shiftapp/common/domain/entities/bankaccount/wallet_provider_item.dart';

class PhoneWalletRequiredData {
  final List<String> disclosure;
  final List<WalletProviderItem> providers;

  PhoneWalletRequiredData({required this.disclosure , required this.providers});
}