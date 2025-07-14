
import 'package:flutter/cupertino.dart';

import 'base_stateless_widget.dart';

abstract class BaseWidget extends BaseStatelessWidget {


  BaseWidget({Key? key}):  super(key: key);

  @protected
  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) => buildWidget(context);


}
