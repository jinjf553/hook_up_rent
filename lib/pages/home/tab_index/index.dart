import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('tabIndex')),
      ),
      body: ListView(children: const [
        CommonSwiper(),
        IndexNavigator(),
        Text('这里是内容区域'),
      ]),
    );
  }
}
