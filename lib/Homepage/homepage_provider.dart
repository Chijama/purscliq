import 'dart:developer';

import 'package:flutter/cupertino.dart';

class HomepageProvider extends ChangeNotifier {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? bankName;
  String? accNumber;
  String? accName;
  String? imgUrl;

  void userInformation(
      String? provFirstName,
      String? provLastName,
      String? provEmail,
      String? provPhone,
      String? provBankName,
      String? provAccNmae,
      String? provAccNumber,
      String? provImgUrl) {
    firstName = provFirstName;
    lastName = provLastName;
    email = provEmail;
    phone = provPhone;
    bankName = provBankName;
    accNumber = provAccNumber;
    accName = provAccNmae;
    imgUrl = provImgUrl;
    log(' this is $firstName, $bankName, $imgUrl');
    notifyListeners();
  }
}
