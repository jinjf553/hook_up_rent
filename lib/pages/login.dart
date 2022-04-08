// 1. 新建文件/pages/home/index.dart
// 2. 添加material, page_content依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

// 3. 编写无状态组件
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PageContent(name: '登录');
  }
}
// 4. 使用PageContent