// 1. 新建文件/pages/home/index.dart
// 2. 添加material, page_content依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

// 1. 需要准备4个tab内容区(tabView)
List<Widget> tabViewList = [
  const PageContent(name: '首页'),
  const PageContent(name: '搜索'),
  const PageContent(name: '咨询'),
  const PageContent(name: '我的'),
];

// 2. 需要准备4个BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: '搜索', icon: Icon(Icons.search)),
  const BottomNavigationBarItem(label: '咨询', icon: Icon(Icons.info)),
  const BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle)),
];

// 3. 编写无状态组件
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageContent(name: '首页');
  }
}
// 4. 使用PageContent