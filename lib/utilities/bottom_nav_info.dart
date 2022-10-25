import 'package:flutter/material.dart';

class BottomNavInfo extends ChangeNotifier{
  int _bIndex = 0;
  int _subIndex = 0;

  int getSubIndex() => _subIndex;

  updateSubIndex(int k) {
    _subIndex = k;
    notifyListeners();
  }

  int getBIndex() => _bIndex;

  updateBIndex(int i) {
    _bIndex = i;
    updateSubIndex(0);
    notifyListeners();
  }
}