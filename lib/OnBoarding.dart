import 'package:flutter/material.dart';

class OnBoarding with ChangeNotifier {
  int _pageIndex = 0;
  var list = ["Screen 1", "Screen 2", "Screen 3"];

  int get pageIndex => _pageIndex;
  void setIndex(val) {
    _pageIndex = val;
    notifyListeners();
  }

  bool _click = true;
  bool get click => _click;
  void setClick(clk) {
    _click == true ? _click = false : _click = true;
    notifyListeners();
  }
}
