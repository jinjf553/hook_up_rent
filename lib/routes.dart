import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/login.dart';

class Routes {
  // 1. 创建routes.dart文件并编写Routes类的基本结构
  //   2. 定义路由名称
  static var home = "/";
  static var login = '/login';
  //   3. 定义路由处理函数
  static final Handler _homeHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return const HomePage();
    },
  );

  static final Handler _loginHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return const LoginPage();
    },
  );
  //   4. 编写函数configureRoutes关联路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandle);
    router.define(login, handler: _loginHandle);
  }
}
