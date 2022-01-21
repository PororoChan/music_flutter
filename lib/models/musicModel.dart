import 'dart:convert';

List<Music> musicFromJson(String str) => List<Music>.from(json.decode(str).map((x) => Music.fromJson(x)));

String musicToJson(List<Music> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Music {
    Music({
        this.idMsc,
        this.title,
        this.singer,
        this.albumMsc,
        this.coverMsc,
        this.msc,
        this.singerDesc,
    });

    String? idMsc;
    String? title;
    String? singer;
    String? albumMsc;
    String? coverMsc;
    String? msc;
    String? singerDesc;

    factory Music.fromJson(Map<String, dynamic> json) => Music(
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
