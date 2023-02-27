import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginProvider extends ChangeNotifier {
  String? token;
  void getToken(String token) {
    token = token;
    print(token);
    notifyListeners();
  }
}
