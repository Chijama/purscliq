import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String? token;
  void getToken(String token) {
    token = token;
    notifyListeners();
  }
}
