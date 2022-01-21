import 'package:music_flutter/contract/musicContract.dart';
import 'package:music_flutter/models/musicModel.dart';
import 'package:music_flutter/services/musicService.dart';

class MusicPresenter {
  MusicService musicService = MusicService();
  late MusicContract _musicContract;

  void loadData() async {
    musicService
        .loadData()
        .then((value) => _musicContract.onSuccessLoadData(value))
        .catchError((message) {
      _musicContract.onFailedLoadData(message);
    });
  }

  set musicContract(MusicContract musicContract) {
    _musicContract = musicContract;
  }
}
