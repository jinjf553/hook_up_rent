import 'package:flutter/material.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('我的')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(children: const [Text('这里是内容区')]),
    );
  }
}
