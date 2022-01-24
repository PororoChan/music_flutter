import 'package:music_flutter/contract/adminContract.dart';
import 'package:music_flutter/contract/musicContract.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/services/musicService.dart';

class MusicPresenters {
  MusicService musicService = MusicService();
  late MusicContract _musicContract;

  void getData() async {
    musicService
        .getMusic()
        .then((value) => _musicContract.onFetchSuccess(value))
        .catchError((message) {
      _musicContract.onFetchFailed(message.toString());
    });
  }

  set musicContract(MusicContract musicContract) {
    _musicContract = musicContract;
  }
}
