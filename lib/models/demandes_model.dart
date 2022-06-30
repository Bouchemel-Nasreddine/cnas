import 'dart:convert';

import 'package:cnas/data%20classes/Demande.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class DemandeModel {
  final _dioClient = dio.Dio();

  Future<dio.Response?> getDemandes() async {
    try {
      dio.Response response = await _dioClient.get(
        'https://cnas2cs.herokuapp.com/demande',
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

  Future<dio.Response?> postDemande({
    required dateDebut,
    required dateFin,
    required x_pat,
    required y_pat,
    required x_hos,
    required y_hos,
    required description,
  }) async {
    dio.Response? response = await _dioClient.post(
      'https://cnas2cs.herokuapp.com/demande',
      data: jsonEncode({}),
    );
  }
}
