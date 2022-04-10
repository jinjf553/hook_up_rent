// 1. 新建文件/pages/home/index.dart
// 2. 添加material, page_content依赖
import 'package:flutter/material.dart';

// 3. 编写无状态组件
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
//     1. 添加Scaffold
    return Scaffold(
      // 2. 完成appBar部分
      appBar: AppBar(title: const Text('登录')),
      // 3. 完成body部分
      body: SafeArea(
        minimum: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            //     1. 用户名
            const TextField(
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            //     2. 密码
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    suffixIcon: IconButton(
                      icon: showPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ))),

            //     3. 登录按钮
            const Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                '登录',
                style: TextStyle(color: Colors.white),
              ),
            ),
            //     4. 注册链接
            const Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('还没有账号,'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('register');
                    },
                    child: const Text(
                      '去注册~',
                      style: TextStyle(color: Colors.green),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
// 4. 主题颜色——theme
// 5. 测试
  }
}
