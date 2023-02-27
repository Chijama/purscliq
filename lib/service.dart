import 'dart:developer';

import 'package:purscliq_app/Homepage/user_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  Future<UserDataModel?>? getUserData() async {
    try {
      var client = http.Client();

      var url = Uri.parse("https://api305.purscliq.com/api/me");
      var response = await client.get(url, headers: {
        "Authorization": "Bearer 3862|VkbEHDe5fUM4YH7m7OjSAWmptRuFmWpC8oENyJSq",
        'Content-type': 'application/json',
        "Accept": "application/json",
      });
      log("This is reponse.body: ${response.body}");
      if (response.statusCode == 200) {
        final json1 = json.decode(response.body);
        log("this is $json1");
        final services = UserDataModel.fromJson(json1);
        return services;
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Failed to load");
    }
  }
}
