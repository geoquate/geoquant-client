import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();

  if (kDebugMode) {
    print(
        'Running in debug mode on ${Platform.isAndroid} so pointing to local emulator');
    if (Platform.isAndroid) {
      FirebaseFirestore.instance.settings =
          Settings(host: '10.0.2.2:8082', sslEnabled: false);

      // FirebaseFunctions.instance
      //     .useFunctionsEmulator(origin: 'http://10.0.2.2:5001');
    } else {
      FirebaseFirestore.instance.settings =
          Settings(host: '127.0.0.1:8082', sslEnabled: false);

      // FirebaseFunctions.instance
      //     .useFunctionsEmulator(origin: 'http://localhost:5001');
    }
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      // home: LoginView(),
    );
  }
}
