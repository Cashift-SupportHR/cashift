
class Validate{

  static String? validateRequired(String? value, String msgError) {
    if (value == null || value.isEmpty) {
      return msgError;
    } else {
      return null;
    }
  }

}