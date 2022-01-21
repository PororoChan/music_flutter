import 'dart:convert';

List<Admin> adminFromJson(String str) => List<Admin>.from(json.decode(str).map((x) => Admin.fromJson(x)));

String adminToJson(List<Admin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Admin {
    Admin({
        this.idLog,
        this.nama,
        this.email,
        this.password,
    });

    int? idLog;
    String? nama;
    String? email;
    String? password;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        idLog: json["id_log"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id_log": idLog,
        "nama": nama,
        "email": email,
        "password": password,
    };
}
