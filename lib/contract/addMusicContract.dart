import 'package:music_flutter/models/musicModel.dart';

abstract class AddMusicContract {
  void onMusicSaveSuccess(String message);
  void onMusicSaveFailed(String message);
}
