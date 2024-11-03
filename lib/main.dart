// Packages
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:async';
import 'package:flutter/material.dart';

// Modules
import 'app_module.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth/login');

    return MaterialApp.router(
      title: 'Task Manager',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.cyan, accentColor: Colors.cyan)),
      routerConfig: Modular.routerConfig,
    );
  }
}
