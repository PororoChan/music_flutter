import 'dart:typed_data';

import 'package:music_flutter/contract/addMusicContract.dart';
import 'package:music_flutter/services/musicService.dart';

class AddMusicPresenter {
  late AddMusicContract _addMusicContract;
  final MusicService _musicService = MusicService();

  set addMusicContract(AddMusicContract addMusicContract) {
    _addMusicContract = addMusicContract;
  }

  void saveMusic(String title, String singer, String album_msc,
      String cover_msc, String msc, String singer_desc) {
    _musicService
        .saveMusic(title, singer, album_msc, cover_msc, msc, singer_desc)
        .then(
      (value) {
        _addMusicContract.onMusicSaveSuccess(value['message']);
        print(value['message']);
      },
    ).catchError((message) {
      _addMusicContract.onMusicSaveFailed(message.toString());
    });
  }
}
