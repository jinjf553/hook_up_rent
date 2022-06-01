import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';

class DioHttp {
  Dio? _client;
  BuildContext? context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  DioHttp._internal(BuildContext context) {
    if (_client == null as Dio || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: Config.baseUrl,
          connectTimeout: 1000 * 10,
          receiveTimeout: 1000 * 3,
          extra: {'context': context});

      var client = Dio(options);
      _client = client;
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return _client!.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return _client!.post(path, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>?> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
        contentType: 'multipart/form-data', headers: {'Authorization': token});
    return _client!.post(path, data: params, options: options);
  }
}
