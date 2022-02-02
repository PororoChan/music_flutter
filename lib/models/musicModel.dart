import 'dart:convert';

List<MusicModel> musicModelFromJson(String str) => List<MusicModel>.from(json.decode(str).map((x) => MusicModel.fromJson(x)));

String musicModelToJson(List<MusicModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MusicModel {
    MusicModel({
        this.idMsc,
        this.title,
        this.singer,
        this.albumMsc,
        this.coverMsc,
        this.msc,
        this.singerDesc,
    });

    int? idMsc;
    String? title;
    String? singer;
    String? albumMsc;
    String? coverMsc;
    String? msc;
    String? singerDesc;

    factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        idMsc: json["id_msc"],
        title: json["title"],
        singer: json["singer"],
        albumMsc: json["album_msc"],
        coverMsc: json["cover_msc"],
        msc: json["msc"],
        singerDesc: json["singer_desc"],
    );

    Map<String, dynamic> toJson() => {
        "id_msc": idMsc,
        "title": title,
        "singer": singer,
        "album_msc": albumMsc,
        "cover_msc": coverMsc,
        "msc": msc,
        "singer_desc": singerDesc,
    };
}
