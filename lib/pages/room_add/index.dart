import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_floating_action_button.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key? key}) : super(key: key);

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('发布房源')),
      body: ListView(
        children: const [],
      ),
      floatingActionButton: CommonFloatingActionButton('提交', () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
