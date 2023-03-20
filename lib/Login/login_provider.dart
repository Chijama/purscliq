import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String? token;
  void getToken(String? provToken) {
    token = provToken;
    notifyListeners();
  }

}
