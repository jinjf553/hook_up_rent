import 'package:flutter/material.dart';

class RoomDetailPage extends StatelessWidget {
  final String roomId;
  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('roomid:$roomId'),
        ),
      ),
      body: Text(roomId),
    );
  }
}
