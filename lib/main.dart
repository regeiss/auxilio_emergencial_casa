import 'package:auxilio_emergencial/firebase_options.dart';
import 'package:auxilio_emergencial/source/features/base/main_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  void registerErrorHandlers() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      debugPrint(details.toString());
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      debugPrint(error.toString());
      return true;
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Ocorreu um erro'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  registerErrorHandlers();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MainApp()));
  FlutterNativeSplash.remove();
}