import '../../../network/constant_codes.dart';

class ApiException implements Exception {
  final String message;
  final String code;

  ApiException(this.message, this.code);
  @override
  String toString() {
    return message;
  }

  bool isEmptyList(){
    return code == ConstantCodes.emptyList;
  }
}
