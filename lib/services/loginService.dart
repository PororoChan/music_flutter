import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginService {
  String base_url = "http://10.21.1.215:8080/login";

  Future<Map> login(String email, String password) async {
    var url = Uri.parse(base_url);
    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    return await jsonDecode(response.body);
  }
}
