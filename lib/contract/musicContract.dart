import 'package:music_flutter/models/musicModel.dart';

abstract class MusicContract {
  void onFetchSuccess(List<MusicModel> music);
  void onFetchFailed(String message);
  void onDeleteError(String message);
  void onDeleteSuccess(String message);
}
