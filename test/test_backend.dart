// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hook_up_rent/config.dart';

void main(List<String> args) async {
  BaseOptions baseOptions = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: 1000 * 10,
      receiveTimeout: 1000 * 3);
  Dio client = Dio(baseOptions);
  String url = '/user/registered';
  String token = '';
  Options options = Options(headers: {'Authorization': token});

  // var res = await client.get(url, options: options);
  var res = await client.post(url,
      data: {'username': 'user', 'password': 'pwd'}, options: options);
  print(json.decode(res.toString())['Hello']);
}
