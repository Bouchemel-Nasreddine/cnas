import 'dart:convert';

import 'package:cnas/config/base_api.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class LoginModel {
  final _dioClient = dio.Dio();

  //depending on the @has_phone , @loginParams sould be phone or email, 0 for email, 1 for phone
  Future<dio.Response?> login({
    required String type,
    required String credential,
    required String password,
  }) async {
    try {
      dio.Response response = await _dioClient.post(
        loginUrl,
        data: dio.FormData.fromMap(
          {
            'type': type,
            'credential': credential,
            'password': password,
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }

      return response;
    } on dio.DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response;
    }
  }

  Future<http.Response> loginWithHttp({
    required String type,
    required String credential,
    required String password,
  }) async {
    http.Response response = await http.post(
      Uri.parse(loginUrl),
      headers: {
        //   'Access-Control-Allow-Origin': '*',
        // 'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
        "Content-type": "application/json"
      },
      body: jsonEncode({
        'type': type,
        'credential': credential,
        'password': password,
      }),
    );

    print(response.body);

    return response;
  }

  Future<dio.Response?> forgetPassword({
    required String email,
  }) async {
    try {
      dio.Response response = await _dioClient.post(
        forgetPasswordUrl,
        data: dio.FormData.fromMap(
          {
            'email': email,
          },
        ),
        options: dio.Options(
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }

      return response;
    } on dio.DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response;
    }
  }

  Future<dio.Response?> resetPassword({
    required String codeActivation,
    required String newPassword,
    required String confirmationPassword,
  }) async {
    try {
      dio.Response response = await _dioClient.post(
        resetPasswordUrl,
        data: dio.FormData.fromMap(
          {
            'code_verification': codeActivation,
            'new_password': newPassword,
            'new_password_confirmation': confirmationPassword,
          },
        ),
        options: dio.Options(
          headers: {
            "Content-type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }

      return response;
    } on dio.DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response;
    }
  }
}
