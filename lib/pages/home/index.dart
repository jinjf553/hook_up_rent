// 1. 新建文件/pages/home/index.dart
// 2. 添加material, page_content依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

// 1. 需要准备4个tab内容区(tabView)
List<Widget> tabViewList = [
  const PageContent(name: '首页'),
  const PageContent(name: '搜索'),
  const PageContent(name: '资讯'),
  const PageContent(name: '我的'),
];

// 2. 需要准备4个BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  const BottomNavigationBarItem(label: '搜索', icon: Icon(Icons.search)),
  const BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info)),
  const BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle)),
];

// 3. 编写无状态组件
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
// 4. 使用PageContent