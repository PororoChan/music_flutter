import 'dart:convert';
import 'package:music_flutter/models/musicModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MusicService {
  static const String _url = "http://10.21.1.215:8000/posts";

  Future<List<MusicModel>> getMusic() async {
    Response response = await http.get(Uri.parse(_url));
    List data = jsonDecode(response.body)['data'] as List;
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

    var url = Uri.parse(_url + "/add");

    var req = await http.MultipartRequest("POST", url)
      ..fields.addAll(data)
      ..files.add(
        await http.MultipartFile.fromPath("cover_msc", cover_msc),
      );

    if (msc != null) {
      req.files.add(await http.MultipartFile.fromPath("msc", msc));
    }

    var res = await req.send();

    var response = await http.Response.fromStream(res);
    return jsonDecode(response.body);
  }

  Future<Map> editMusic(
      String id,
      String? title,
      String? singer,
      String? album_msc,
      String? cover_msc,
      String? msc,
      String? singer_desc) async {
    Map<String, String> data = {};
    if (title != null) {
      data['title'] = title;
    }
    if (singer != null) {
      data['singer'] = singer;
    }
    if (album_msc != null) {
      data['album_msc'] = album_msc;
    }
    if (singer_desc != null) {
      data['singer_desc'] = singer_desc;
    }

    var url = Uri.parse(_url + "/update" + "/${id}");

    var request = await http.MultipartRequest("POST", url);
    request.fields.addAll(data);
    if (cover_msc != null) {
      request.files.add(
        await http.MultipartFile.fromPath("cover_msc", cover_msc),
      );
    }

    if (msc != null) {
      request.files.add(
        await http.MultipartFile.fromPath("msc", msc),
      );
    }

    var res = await request.send();

    var response = await http.Response.fromStream(res);
    return jsonDecode(response.body);
  }

  Future<MusicModel> findMusic(String id) async {
    var url = Uri.parse(_url + "/${id}");

    var request = await http.get(url);
    Map<String, dynamic> result = jsonDecode(request.body)['data'];

    return MusicModel.fromJson(result);
  }

  Future<String> deleteMusic(String id) async {
    var url = Uri.parse(_url + "/${id}");
    var response = await http.delete(url);

    var data = jsonDecode(response.body);
    return data['message'] ?? "";
  }
}
