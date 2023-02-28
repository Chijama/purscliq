import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'Homepage/user_data_model.dart';

class Service {
  Future<UserDataModel?>? getUserData() async {
    try {
      var client = http.Client();

      var url = Uri.parse("https://api305.purscliq.com/api/me");
      var response = await client.get(
        url,
        headers: {
          "Authorization":
              "Bearer 3900|PSQdXvdXd85Mrc1k2GxVlSY54VsxP3kBQNSFCK15",
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
