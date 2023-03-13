import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String? token;
  void getToken(String? ptoken) {
    token = ptoken;
    notifyListeners();
  }

  String? setToken() {
    return token;
  }
}
