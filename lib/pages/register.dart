// 1. 新建文件/pages/home/index.dart
// 2. 添加material, page_content依赖
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';

// 3. 编写无状态组件
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  _registerHandler() async {
    String username = usernameController.text;
    String password = usernameController.text;
    String repeatPassword = usernameController.text;
    if (password != repeatPassword) {
      CommonToast.showToast('两次输入的密码不一致！');
      return;
    }
    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空！');
      return;
    }

    const url = '/user/registered';
    Map<String, String> params = {"username": username, "password": password};
    var res = await DioHttp.of(context).post(url, params);
    var resString = json.decode(res.toString());

    int status = resString['status'];
    String description = resString['description'] ?? '内部错误';
    CommonToast.showToast(description);
    if (status.toString().startsWith('2')) {
      Navigator.of(context).pushReplacementNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
//     1. 添加Scaffold
    return Scaffold(
      // 2. 完成appBar部分
      appBar: AppBar(title: const Text('注册')),
      // 3. 完成body部分
      body: SafeArea(
        minimum: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            //     1. 用户名
            TextField(
              controller: usernameController,
              decoration:
                  const InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            //     2. 密码
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
                controller: passwordController,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                )),

            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
                controller: repeatPasswordController,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: '确认密码',
                  hintText: '请输入密码',
                )),

            //     3. 登录按钮
            const Padding(padding: EdgeInsets.all(10.0)),
            ElevatedButton(
              onPressed: _registerHandler,
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                '注册',
                style: TextStyle(color: Colors.white),
              ),
            ),
            //     4. 注册链接
            const Padding(padding: EdgeInsets.all(10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已没有账号,'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('login');
                    },
                    child: const Text(
                      '去登录~',
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
