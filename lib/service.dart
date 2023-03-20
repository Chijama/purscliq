import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../Login/login_provider.dart';
import 'user_data_model.dart';

class Service {
  Future<UserDataModel?>? getUserData(BuildContext context) async {
    try {
      var client = http.Client();
      
      var url = Uri.parse("https://api305.purscliq.com/api/me");
      var loginState = Provider.of<LoginProvider>(context, listen: false);
      var token = loginState.token;
      log("Login state $token");
      var response = await client.get(
        
        url,
        headers: {
          "Authorization":
              "Bearer $token",
          'Content-type': 'application/json',
          "Accept": "application/json",
        },
      );
      log("response ${response.body}");
      if (response.statusCode == 200) {
        final services = UserDataModel.fromJson(json.decode(response.body));
        log("returned ${services.toJson()}");
        return services;
      } else {
        log("failed to fetch users =>${response.statusCode} => ${response.body}");
        return UserDataModel();
      }
    } catch (e) {
      log("catch error from get user => $e");
      return UserDataModel();
    }
  }
}
