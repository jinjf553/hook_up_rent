// 1. 新建文件/widgets/page_content.dart
// 2. 添加material依赖
import 'package:flutter/material.dart';

// 3. 编写无状态组件
class PageContent extends StatelessWidget {
  final String? name;
// 4. 添加name参数
  const PageContent({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当前页面：$name'),
      ),
    );
  }
}

// 5. 使用Scaffold