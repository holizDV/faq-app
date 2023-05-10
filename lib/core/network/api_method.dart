import 'package:dio/dio.dart';

import '../error/exceptions.dart';

abstract class ApiMethod {
  Future<dynamic> get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  });

  Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });

  Future<dynamic> delete({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  });
}

class ApiMethodImpl implements ApiMethod {
  final Dio dio;

  ApiMethodImpl(this.dio);

  final _timeOutDuration = 10;

  _returnResponse({required Response response}) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 401:
        throw UnAuthorizedException(response.data["message"]["error"]);
      default:
        throw ServerException(response.data["message"]);
    }
  }

  @override
  Future get({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    final response = await dio
        .get(
          url,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          queryParameters: params,
        )
        .timeout(Duration(seconds: _timeOutDuration));
    return _returnResponse(response: response);
  }

  @override
  Future post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio
        .post(
          url,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          data: body,
        )
        .timeout(Duration(seconds: _timeOutDuration));
    return _returnResponse(response: response);
  }

  @override
  Future delete({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    final response = await dio
        .delete(
          url,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          queryParameters: params,
        )
        .timeout(Duration(seconds: _timeOutDuration));
    return _returnResponse(response: response);
  }
}
