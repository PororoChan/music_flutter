import 'dart:convert';

import 'package:music_flutter/models/musicModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicService {
  static const String url = "http://10.21.1.215:8080/music";
  Future<List<Music>> loadData() async {
    Response response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body);
    List<Music> music = [];
    for (var item in data) {
      music.add(Music.fromJson(item));
    }
    return music;
  }


}
