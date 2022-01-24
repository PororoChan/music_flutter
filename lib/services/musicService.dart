import 'dart:convert';
import 'package:music_flutter/models/musicModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicService {
  static const String _url = "http://10.21.1.215:8080/music";

  Future<List<MusicModel>> getMusic() async {
    Response response = await http.get(Uri.parse(_url));
    List data = jsonDecode(response.body);
    List<MusicModel> music = [];

    for (var item in data) {
      music.add(MusicModel.fromJson(item));
    }
    return music;
  }

  Future<Map> saveMusic(String title, String singer, String album_msc,
      String cover_msc, String msc, String singer_desc) async {
    Map<String, String> data = {
      'title': title,
      'singer': singer,
      'album_msc': album_msc,
      'cover_msc': cover_msc,
      'msc': msc,
      'singer_desc': singer_desc,
    };

    var url = Uri.parse(_url);

    var req = await http.MultipartRequest("POST", url)
    ..fields.addAll(data)
    ..files.add(
      await http.MultipartFile.fromPath("cover_msc", cover_msc),
    );
    var res = await req.send();

    var response = await http.Response.fromStream(res);
    return jsonDecode(response.body);
  }
}
