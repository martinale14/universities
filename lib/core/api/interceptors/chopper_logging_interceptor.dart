import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

@immutable
class ChopperLoggingInterceptor
    implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final base = await request.toBaseRequest();
    if (base is http.Request) {
      final body = base.body;

      var headers = StringBuffer();
      base.headers.forEach((k, v) => headers.write(' $k: $v'));

      var bytes = '0';

      if (body.isNotEmpty) {
        bytes = ' (${base.bodyBytes.length}-byte body)';
      }

      var message = 'Request -> method 🥳 -> ${base.method}\n'
          '-> url 🥳 -> ${base.url}'
          '\n'
          '-> headers 🐶 -> ${headers.toString()}'
          '\n'
          '-> body -> 🤪 \n$body\n '
          '\n'
          '--> END 🤪 ${base.method}$bytes';
      debugPrint('\x1B[33m$message\x1B[0m');
    }
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    final base = response.base.request;

    if (response.base is http.Response) {
      final resp = response.base as http.Response;
      if (resp.body.isNotEmpty) {
        var bytes = ' (${response.bodyBytes.length}-byte body)';
        var headers = StringBuffer();
        response.base.headers.forEach((k, v) => headers.write(' $k: $v'));

        var message = 'Response -> status code 🤔 -> ${response.statusCode}\n'
            '-> url 🥳 -> ${base?.url}'
            '\n'
            '-> headers 🐶 -> ${headers.toString()}'
            '\n'
            '-> response -> 😲 \n${resp.body}\n '
            '\n'
            '--> END 🤪 ${base?.method}$bytes';
        debugPrint('\x1B[33m$message\x1B[0m');
      }
    }
    return response;
  }
}
