import 'dart:js';

import 'package:cnas/config/generale_vars.dart';
import 'package:cnas/viewmodels/patient_viewmodel.dart';
import 'package:cnas/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cnas/viewmodels/auth/login_viewmodel.dart';
import 'package:cnas/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/auth/loginView.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PatientViewModel()),
    ChangeNotifierProvider(create: (context) => LoginViewModel()),
  ], child: const MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      navigatorKey: mainNavigatorKey,
      routes: {
        '/': (context) => LoginView(),
      },
      initialRoute: '/',
    );
  }
}
