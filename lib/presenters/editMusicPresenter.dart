import 'package:music_flutter/contract/addMusicContract.dart';
import 'package:music_flutter/contract/editMusicContract.dart';
import 'package:music_flutter/contract/musicContract.dart';
import 'package:music_flutter/services/musicService.dart';

class EditMusicPresenter {
  final MusicService _musicService = MusicService();
  late EditMusicContract _editMusicContract;

  set editMusicContract(EditMusicContract editMusicContract) {
    _editMusicContract = editMusicContract;
  }

  void editMusic(String id, String? title, String? singer, String? album_msc,
      String? cover_msc, String? msc, String? singer_desc) {
    _editMusicContract.onEditStart();
    _musicService
        .editMusic(id, title, singer, album_msc, cover_msc, msc, singer_desc)
        .then(
          (value) => _editMusicContract.onEditSuccess(value['message']),
        )
        .catchError(
      (message) {
        _editMusicContract.onEditFailed(message.toString());
      },
    );
  }

  void findMusic(String id) {
    _editMusicContract.onFetchDataStart();
    _musicService
        .findMusic(id)
        .then(
          (value) => _editMusicContract.onFetchDataSuccess(value),
        )
        .catchError((message) {
      _editMusicContract.onFetchDataFailed(message.toString());
    });
  }
}
