import 'package:shiftapp/data/exceptions/app_base_exception.dart';

/// A special exception/state to indicate loading is in progress
class LoadingStreamException extends AppBaseException {
  @override
  String messageEn = 'Loading...';
  @override
  String messageAr = 'جاري التحميل...';
}
