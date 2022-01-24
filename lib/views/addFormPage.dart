// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field, unused_import
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/services/musicService.dart';
import 'package:music_flutter/contract/musicContract.dart';
import 'package:music_flutter/presenters/musicPresenters.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _singer = TextEditingController();
  final _album_msc = TextEditingController();
  final _cover_msc = TextEditingController();
  final _msc = TextEditingController();
  final _singer_desc = TextEditingController();
  File? _picture;

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
                    "Add Music",
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
                        hintText: "Add Song Title",
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

                              _cover_msc.text = image!.name;
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
                              hintText: "Upload your Song",
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
                        hintText: "Add Artist Description",
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
                            String cover_msc = _cover_msc.text;
                            String msc = _msc.text;
                            String singer_desc = _singer_desc.text;

                            
                          },
                          child: Text(
                            "Save",
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
}
