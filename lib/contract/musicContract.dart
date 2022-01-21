import 'package:music_flutter/models/musicModel.dart';

abstract class MusicContract {
  void onSuccessLoadData(List<Music> data);
  void onFailedLoadData(String message);
}
