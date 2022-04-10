// 1. 新建文件/pages/home/index.dart
// 2. 添加material, page_content依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

// 3. 编写无状态组件
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     1. 添加Scaffold
    return Scaffold(
      // 2. 完成appBar部分
      appBar: AppBar(title: const Text('登录')),
      // 3. 完成body部分
      body: Column(
        children: [
          //     1. 用户名
          const TextField(
            decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
          ),
          //     2. 密码
          const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: '密码', hintText: '请输入密码')),
          //     3. 登录按钮
          ElevatedButton(
            onPressed: () {},
            child: const Text('登录'),
          ),
          //     4. 注册链接
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('还没有账号,'),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('register');
                  },
                  child: const Text('去注册~'))
            ],
          ),
        ],
      ),
    );
// 4. 主题颜色——theme
// 5. 测试
  }
}
