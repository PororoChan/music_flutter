// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter/contract/musicContract.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/presenters/musicPresenters.dart';
import 'package:music_flutter/views/addFormPage.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:music_flutter/views/editMusicPage.dart';
import 'package:music_flutter/views/widget/slidable_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<MusicModel> data = [];

class _HomePageState extends State<HomePage> implements MusicContract {
  MusicPresenters musicPresenters = MusicPresenters();

  _HomePageState() {
    musicPresenters.musicContract = this;
    musicPresenters.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        title: Text(
          "My Music",
          style: TextStyle(fontFamily: 'Ubuntu'),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 10,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormPage()));
        },
        label: Text("Add Music"),
        icon: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, index) {
            var msc = data[index];
            return Padding(
              padding: EdgeInsets.only(
                  top: 1.0, bottom: 5.0, left: 10.0, right: 10.0),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                child: SlidableListview(
                    index: index,
                    title: msc.title ?? "Untitled Song",
                    singer: msc.singer ?? "Unknown Artist",
                    album_msc: msc.albumMsc ?? "Unknown Album",
                    cover_msc: msc.coverMsc ?? "Uncovered",
                    msc: msc.msc ?? "Null",
                    singer_desc: msc.singerDesc ?? "No Desc",
                    onDelete: (BuildContext context) {
                      musicPresenters.deleteMusic(msc.idMsc ?? "0");
                    },
                    onEdit: (BuildContext context) async {
                      var hasil = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        var musc = data[index];
                        return EditMusicPage(id: musc.idMsc ?? '0');
                      }));
                    }),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void onFetchFailed(String message) {
    // TODO: implement onFetchFailed
    print(message);
  }

  @override
  void onFetchSuccess(List<MusicModel> music) {
    // TODO: implement onFetchSuccess
    setState(() {
      data = music;
    });
  }

  @override
  void onDeleteError(String message) {
    // TODO: implement onDeleteError
    print(message);
  }

  @override
  void onDeleteSuccess(String message) {
    // TODO: implement onDeleteSuccess
    musicPresenters.getData();
  }
}
