import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_navigator.dart';
import 'package:hook_up_rent/pages/home/tab_index/index_recommend.dart';
import 'package:hook_up_rent/widgets/common_swiper.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          shwoLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: const [
        CommonSwiper(),
        IndexNavigator(),
        IndexRecommend(),
        Info(showTitle: true),
        Text('这里是内容区域'),
      ]),
    );
  }
}
