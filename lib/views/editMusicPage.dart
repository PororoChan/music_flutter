// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_flutter/contract/addMusicContract.dart';
import 'package:music_flutter/contract/editMusicContract.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/presenters/addMusicPresenter.dart';
import 'package:music_flutter/presenters/editMusicPresenter.dart';
import 'package:http/http.dart' as http;
import 'package:music_flutter/views/homePage.dart';

class EditMusicPage extends StatelessWidget implements EditMusicContract {
  EditMusicPage({required this.id, Key? key}) : super(key: key) {
    _editMusicPresenter.editMusicContract = this;
    _editMusicPresenter.findMusic(id);
  }

  String id;

  final _formKey = GlobalKey<FormState>();
  final _editMusicPresenter = Get.put(EditMusicPresenter());

  final _title = TextEditingController();
  final _singer = TextEditingController();
  final _album_msc = TextEditingController();
  final _cover_msc = TextEditingController();
  final _msc = TextEditingController();
  final _singer_desc = TextEditingController();
  File? _picture, _music;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Form(
            child: Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  right: MediaQuery.of(context).size.width / 15),
              padding: EdgeInsets.all(18.0),
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "Edit Data Music",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  TextFormField(
                    controller: _title,
                    autocorrect: false,
                    autofocus: false,
                    obscureText: false,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Ubuntu',
                        color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.title,
                          color: Colors.white70,
                        ),
                        hintText: "Song Title",
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Ubuntu',
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  TextFormField(
                    controller: _singer,
                    autocorrect: false,
                    autofocus: false,
                    obscureText: false,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.perm_identity,
                          color: Colors.white70,
                        ),
                        hintText: "Singer's name",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Ubuntu',
                          color: Colors.white70,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  TextFormField(
                    controller: _album_msc,
                    autocorrect: false,
                    autofocus: false,
                    obscureText: false,
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.album,
                          color: Colors.white70,
                        ),
                        hintText: "Song's Album",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Ubuntu',
                          color: Colors.white70,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _cover_msc,
                          enabled: false,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Ubuntu'),
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.image,
                                color: Colors.white70,
                              ),
                              hintText: "Pick Music Cover",
                              hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Ubuntu'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0))),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () async {
                              ImagePicker _image = ImagePicker();
                              final XFile? image = await _image.pickImage(
                                source: ImageSource.gallery,
                              );

                              if (image == null) return;

                              _cover_msc.text = image.name;
                              _picture = File(image.path);
                            },
                            child: Icon(
                              Icons.image_search,
                              color: Colors.white70,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          enabled: false,
                          controller: _msc,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                          autocorrect: false,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.audiotrack,
                                color: Colors.white70,
                              ),
                              hintText: "Upload Song",
                              hintStyle: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Ubuntu',
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 8,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            onPressed: () async {
                              FilePickerResult? song =
                                  await FilePicker.platform.pickFiles();

                              if (song == null) {
                                return;
                              } else {
                                _msc.text = (song.files.single.name);
                                _music = File(song.files.single.path ?? "");
                              }
                            },
                            child: Icon(
                              Icons.audiotrack,
                              color: Colors.white70,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  TextFormField(
                    controller: _singer_desc,
                    maxLines: 8,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Ubuntu',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                        hintText: "Artist Description",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Ubuntu'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.orange),
                          onPressed: () {
                            _title.clear();
                            _singer.clear();
                            _album_msc.clear();
                            _cover_msc.clear();
                            _msc.clear();
                            _singer_desc.clear();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            String title = _title.text;
                            String singer = _singer.text;
                            String album_msc = _album_msc.text;
                            String singer_desc = _singer_desc.text;

                            if (title != null &&
                                singer != null &&
                                album_msc != null &&
                                singer_desc != null) {
                              _editMusicPresenter.editMusic(
                                  id,
                                  title,
                                  singer,
                                  album_msc,
                                  _picture!.path,
                                  _music!.path,
                                  singer_desc);
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onEditFailed(String message) {
    // TODO: implement onEditFailed
    print(message);
  }

  @override
  void onEditStart() {
    // TODO: implement onEditStart
  }

  @override
  void onEditSuccess(String message) {
    // TODO: implement onEditSuccess
  }

  @override
  void onFetchDataFailed(String message) {
    // TODO: implement onFetchDataFailed
    print("salah");
  }

  @override
  void onFetchDataStart() {
    // TODO: implement onFetchDataStart
  }

  @override
  void onFetchDataSuccess(MusicModel musicModel) {
    // TODO: implement onFetchDataSuccess
    _title.text = musicModel.title ?? "";
    _singer.text = musicModel.singer ?? "";
    _album_msc.text = musicModel.albumMsc ?? "";
    _cover_msc.text = musicModel.coverMsc ?? "";
    _msc.text = musicModel.msc ?? "";
    _singer_desc.text = musicModel.singerDesc ?? "";
  }
}
