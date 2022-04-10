import 'package:flutter/material.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('tabIndex')),
      ),
      body: ListView(children: const [
        Text('这里是内容区域'),
      ]),
    );
  }
}
