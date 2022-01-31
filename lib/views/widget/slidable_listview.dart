import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:music_flutter/models/musicModel.dart';

AudioPlayer _audioPlayer = AudioPlayer();

var url =
    'http://10.21.1.215:8080/assets/song/1643252959_43234f6c818a42c2e7d0.mp3';

class SlidableListview extends StatelessWidget {
  SlidableListview({
    Key? key,
    required this.index,
    required this.title,
    required this.singer,
    required this.album_msc,
    required this.cover_msc,
    required this.msc,
    required this.singer_desc,
    required this.onDelete,
    required this.onEdit,
    // required this.onDetail,
  }) : super(key: key);

  int index;
  String title;
  String singer;
  String album_msc;
  String cover_msc;
  String msc;
  String singer_desc;
  Function(BuildContext context) onDelete;
  Function(BuildContext context) onEdit;
  // Function(BuildContext context) onDetail;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        dismissible: null,
        children: [
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            label: 'Delete',
            onPressed: onDelete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          )
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          singer,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu', 
            color: Colors.black54,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          child: Image.network(cover_msc),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.stop),
              splashColor: Colors.blue,
            ),
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.pause),
              splashColor: Colors.blue,
            ),
            IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.play_arrow),
              splashColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

// void playAudio() async {
//   _audioPlayer.play(url);
// }

// void pauseAudio() async {
//   _audioPlayer.pause();
// }

// void stopAudio() async {
//   _audioPlayer.stop();
// }
