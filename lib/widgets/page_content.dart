// 1. 新建文件/widgets/page_content.dart
// 2. 添加material依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';

// 3. 编写无状态组件
class PageContent extends StatelessWidget {
  final String? name;
// 4. 添加name参数
  const PageContent({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('当前页面：$name')),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.home);
              },
              child: Text(Routes.home)),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              child: Text(Routes.login)),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/aaaa');
              },
              child: const Text('不存在的页面')),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/room/2222');
              },
              child: const Text('房屋详情页, id: 2222')),
        ],
      ),
    );
  }
}

// 5. 使用Scaffold