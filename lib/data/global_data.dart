import 'package:flutter/foundation.dart';

class GlobalData extends ChangeNotifier{
  String _nickName = "*****";
  String _name = "***";
  String _email = "*****@gmail.com";

  String get nickName => _nickName;

  set nickName(String value) {
    _nickName = value;
    notifyListeners();
  }

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}