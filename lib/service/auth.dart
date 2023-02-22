import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isloggedin = false;

  bool get authenticated => _isloggedin;
  void login({Map? creds}) {
    _isloggedin = true;
    notifyListeners();
    print(creds);
  }

  void logout() {
    _isloggedin = false;
    notifyListeners();
  }
}
