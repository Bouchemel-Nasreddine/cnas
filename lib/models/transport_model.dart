import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class TransportModel {
  final _dioClient = dio.Dio();

  Future<dio.Response?> getTransport() async {
    try {
      dio.Response response = await _dioClient.get(
        'https://cnas2cs.herokuapp.com/transport',
        options: dio.Options(
          contentType: "application/json",
        ),
      );

      return response;
    } on dio.DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return e.response;
    }
  }
}