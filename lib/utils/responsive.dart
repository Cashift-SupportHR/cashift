import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
 late double _height;
  late double _width;
  late  double _heightPadding;
  late double _widthPadding;

  AppConfig({required this.context}) {
    MediaQueryData _queryData = MediaQuery.of(context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    print('AppConfig calculator ${_queryData.size.height}');

    _heightPadding =
        _height - ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double rH(double v) {
    return _height * v;
  }

  double rW(double v) {
    return _width * v;
  }

  double rHP(double v) {
    return _heightPadding * v;
  }

  double rWP(double v) {
    return _widthPadding * v;
  }

}


double kPercent( {required double percent , required max}) {
  return ((max / 100) * (percent));
}
