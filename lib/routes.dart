import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/not_found.dart';
import 'package:hook_up_rent/pages/room_detail/index.dart';

class Routes {
  // 1. 创建routes.dart文件并编写Routes类的基本结构
  //   2. 定义路由名称
  static var home = "/";
  static var login = '/login';
  static var roomDetail = '/room/:roomId';
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

  static final Handler _notFoundHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return const NotFoundPag();
    },
  );
  static final Handler _roomDetailHandle = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return RoomDetailPage(
        roomId: params['roomId'][0],
      );
    },
  );
  //   4. 编写函数configureRoutes关联路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandle);
    router.define(login, handler: _loginHandle);
    router.notFoundHandler = _notFoundHandle;
    router.define(roomDetail, handler: _roomDetailHandle);
  }
}
