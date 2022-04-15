import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('我的'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting');
              },
              icon: const Icon(Icons.settings))
        ],
        backgroundColor: Colors.green,
      ),
      body: ListView(children: const [Header(), Text('这里是内容区')]),
    );
  }
}
