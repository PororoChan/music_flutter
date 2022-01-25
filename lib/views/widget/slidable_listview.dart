import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        trailing: IconButton(
          onPressed: (){},
          icon: Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
