import 'package:cnas/models/auth/login_model.dart';
import 'package:cnas/config/generale_vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

import '../../data classes/Patient.dart';
import '../../config/const.dart';
import '../../views/home.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final forgottenEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final verificationCodeController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool working = false;
  final model = LoginModel();

  // getWilaya() async {
  //   http.Response response = await http.get(
  //     Uri.parse('http://34.88.7.144/sahla/public/api/willaya'),
  //     headers: {
  //       "Accept": "application/json",
  //     },
  //   );
  //   if (kDebugMode) {
  //     print(response.body);
  //   }
  // }

  Future<void> login(BuildContext context) async {
    /*
    if (working) return;
    working = true;
    notifyListeners();
    dio.Response? response = await model.login(
      hasPhone: isPhone(emailController.text),
      loginParamName: getLoginParamName(emailController.text),
      loginParam: emailController.text,
      password: passwordController.text,
    );

    if (response == null) {
      showSnackBar(context: context, message: "erreur dans l'authentification");
      working = false;
      notifyListeners();
      return;
    }
    if (response.statusCode == 200) {
      var userCont = Patient.fromJson(response.data);

        navigateToHome(context);


    } else {
      showSnackBar(context: context, message: "erreur dans l'authentification");
    }

    working = false;
    notifyListeners();

     */
    navigateToHome(context);
  }

  Future<void> forgetPassword(BuildContext context) async {
    if (working) return;
    working = true;
    notifyListeners();

    dio.Response? response =
    await model.forgetPassword(email: forgottenEmailController.text);

    if (response == null) {
      showSnackBar(context: context, message: "erreur dans la récuperaton");
      working = false;
      notifyListeners();
      return;
    }

    if (response.statusCode == 200) {
      showSnackBar(
          context: context,
          message: "un mail a été envoyé vers l'adresse indiquée");
      Navigator.of(context).pushNamed('/reset_password_view');
    } else if (response.statusCode == 422) {
      displayErrors(context: context, data: response.data);
    } else {
      showSnackBar(context: context, message: "erreur dans la récuperaton");
    }

    working = false;
    notifyListeners();
    return;
  }

  void ressetPassword(BuildContext context) async {
    if (working) return;
    working = true;
    notifyListeners();

    dio.Response? response = await model.resetPassword(
      codeActivation: verificationCodeController.text,
      newPassword: newPasswordController.text,
      confirmationPassword: confirmPasswordController.text,
    );

    if (response == null) {
      showSnackBar(
          context: context, message: "erreur dans la reinitialisation");
      working = false;
      notifyListeners();
      return;
    }

    if (response.statusCode == 200) {
      showSnackBar(
          context: context, message: "mot de passe reinitialiser avec success");
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    } else if (response.statusCode == 422) {
      displayErrors(context: context, data: response.data);
    } else {
      showSnackBar(context: context, message: "erreur dans la récuperaton");
    }

    working = false;
    notifyListeners();
    return;
  }

  displayErrors(
      {required BuildContext context, required Map<String, dynamic> data}) {
    String message = "";
    var errors = data['errors'];
    errors.forEach((key, value) {
      message = message + value[0] + '\n';
    });
    message = message.substring(0, message.length - 1);
    showSnackBar(context: context, message: message);
  }

  int isPhone(String s) {
    return double.tryParse(s) != null ? 1 : 0;
  }

  String getLoginParamName(String s) {
    return double.tryParse(s) != null ? 'phone' : 'email';
  }

  navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=> Home()), (route)=>false);
  }

  showSnackBar(
      {required BuildContext context,
        required String message,
        Duration duration = const Duration(seconds: 4)}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}