import 'package:flutter/material.dart';
import 'package:music_flutter/contract/musicContract.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/presenters/musicPresenters.dart';
import 'package:music_flutter/services/musicService.dart';

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
      body: Container(
        child: ListView.separated(
          separatorBuilder: (_, __) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemCount: data.length,
          itemBuilder: (_, index) {
            var msc = data[index];
            return ListTile(
              leading: Image.network(
                msc.coverMsc ?? "",
                width: 65,
              ),
              title: Text(
                msc.title ?? "Unknown",
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0),
              ),
              subtitle: Text(
                msc.singer ?? "",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.w500,
                ),
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
}
