import 'dart:async';

import 'package:devcademy_flutter/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    // delegate error handling to the active zone
    Zone.current
        .handleUncaughtError(errorDetails.exception, errorDetails.stack!);
  };

  // This captures everything else. Mostly event callback errors.
  // Flutter aggresively catches errors when kDebugMode=true so a lot of your errors won't be processed by this zone
  // but will be in a production release: https://stackoverflow.com/questions/57879455/flutter-catching-all-unhandled-exceptions
  runZonedGuarded(() {
    runApp(const App());
  }, (error, stack) {
    FlutterError.dumpErrorToConsole(
      FlutterErrorDetails(exception: error, stack: stack),
    );
  });
}
