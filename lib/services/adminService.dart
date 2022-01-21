import 'dart:convert';

import 'package:music_flutter/models/adminModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AdminService {
  static const String url = "http://10.21.1.215:8080/login";
  Future<List<Admin>> loadData() async {
    Response response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body)['results'];
    List<Admin> admin = [];
    for (var item in data) {
      admin.add(Admin.fromJson(item));
    }
    return admin;
  }


}
