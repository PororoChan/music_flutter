import 'package:music_flutter/models/musicModel.dart';

abstract class EditMusicContract {
  void onFetchDataStart();
  void onFetchDataSuccess(MusicModel musicModel);
  void onFetchDataFailed(String message);
  void onEditStart();
  void onEditSuccess(String message);
  void onEditFailed(String message);
}
