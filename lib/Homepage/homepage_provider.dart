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

  void UserInformation(
    String? provFirstName,
    String? provLastName,
    String? provEmail,
    String? provPhone,
    String? provBankName,
    String? provAccNmae,
    String? provAccNumber,
  ) {
    firstName = provFirstName;
    lastName = provLastName;
    email = provEmail;
    phone = provPhone;
    bankName = provBankName;
    accNumber = provAccNumber;
    accName = provAccNmae;
    log(' this is $firstName, $bankName');
    notifyListeners();
  }
}
