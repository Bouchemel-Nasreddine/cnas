import 'package:cnas/config/generale_vars.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class PatientModel {
  final _dioClient = dio.Dio();

  Future<dio.Response?> getPatient() async {
    try {
      dio.Response response = await _dioClient.get(
        'https://cnas2cs.herokuapp.com/patient/${patientConst!.idPatient}',
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
