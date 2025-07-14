import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

class CustodyInitializeState extends CommonStateFBuilder {
  final List<Covenant> custodyTypes;
  final List<AddCovenantFocusPointParams>? custody;
  final bool isNew ;
  CustodyInitializeState({required this.custodyTypes, this.custody ,this.isNew=true});
}
