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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PatientViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: mainNavigatorKey,
      routes: {
        '/': (context) => LoginView(),
      },
      initialRoute: '/',
    );
  }
}

