import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hosanna/utlilities/Strings.dart';

class Request {
  final String url;
  final dynamic body;
  final String token;

  Request(this.url, this.body, [this.token]);

  Future<Response> post() async {
    Dio dio = new Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        validateStatus: (_) => true,
        baseUrl: url,
        followRedirects: false,
        connectTimeout: 100000,
        receiveTimeout: 100000,
        headers: {
          "Authorization": "Bearer $token",
          "X-Requested-With": "XMLHttpRequest",
        },
      ),
    );

    Response response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: "application/json",
        headers: {
          "Authorization": "Bearer $token",
          "X-Requested-With": "XMLHttpRequest",
        },
      ),
    );
    return response;
  }

  Future<Response> put() async {
    Dio dio = Dio(BaseOptions(
      baseUrl: Strings.baseURL + Strings.register,
      // headers: {"Authorization": "Bearer $token"},
      responseType: ResponseType.json,
      connectTimeout: 100000,
      receiveTimeout: 100000,
      headers: {
        "Authorization": "Bearer $token",
        "X-Requested-With": "XMLHttpRequest",
      },
    ));
    Response response = await dio.put(
      Strings.baseURL + url,
      data: body,
      options: Options(
        contentType: "application/json",
        headers: {
          "Authorization": "Bearer $token",
          "X-Requested-With": "XMLHttpRequest",
        },
      ),
    );
    return response;
  }

  Future<Response> postMultipart() async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: 100000,
        receiveTimeout: 100000,
        responseType: ResponseType.json,
        contentType: "application/json",
        headers: {
          "Authorization": "Bearer $token",
          "X-Requested-With": "XMLHttpRequest",
        },
      ),
    );

    FormData formData = new FormData.fromMap(body);

    Response response = await dio.post(
      url,
      data: formData,
      onSendProgress: (int sent, int total) {
        print('sent $sent : Total $total');
      },
    );
    return response;
  }

  Future<Response> get() async {
    Dio dio = Dio(BaseOptions(
      baseUrl: Strings.baseURL,
      headers: {"Authorization": "Bearer $token"},
      responseType: ResponseType.json,
      connectTimeout: 100000,
      receiveTimeout: 100000,
    ));
    Response response = await dio.get(
      Strings.baseURL + url,
      queryParameters: body,
      options: Options(
        contentType: "application/json",
      ),
    );
    return response;
  }
}
