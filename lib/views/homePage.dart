// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_local_variable, unused_element, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/presenters/musicPresenter.dart';
import 'package:music_flutter/contract/musicContract.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements MusicContract {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  MusicPresenter musicPresenter = MusicPresenter();

  _HomePageState() {
    musicPresenter.musicContract = this;
    musicPresenter.loadData();
  }

  List<Music> data = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    initState() {
      setState(() {
        onSuccessLoadData(data);
      });
    }

    return Scaffold(
      key: _scaffoldState,
      body: Stack(
        children: <Widget>[
          _appBarBuild(mediaQuery),
          _appBar(mediaQuery),
          _buildListView(mediaQuery),
        ],
      ),
    );
  }

  @override
  void onFailedLoadData(String message) {
    print("apa?");
  }

  @override
  void onSuccessLoadData(List<Music> msc) {
    setState(() {
      data = msc;
    });
  }
}

Widget _appBar(MediaQueryData mediaQuery) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
    child: TextFormField(
        autofocus: false,
        autocorrect: false,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Search Song",
            hintStyle:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))),
  );
}

Widget _appBarBuild(MediaQueryData mediaQuery) {
  return Container(
    height: mediaQuery.size.height * 0.12,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black,
            Colors.black87,
          ],
        ),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(45), bottomLeft: Radius.circular(45))),
  );
}

Widget _buildListView(MediaQueryData mediaQuery) {
  List<Music> data = [];
  return Container(
    child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, index) {
        var item = data[index];
        return ListTile(
          leading: Image.network(item.coverMsc ?? ""),
          title: Text(item.title ?? ""),
          subtitle: Text(item.singer ?? ""),
        );
      },
    ),
  );
}
