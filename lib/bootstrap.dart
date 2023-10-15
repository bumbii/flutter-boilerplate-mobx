import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mobx/api/rest/rest_client_provider.dart';
import 'package:flutter_boilerplate_mobx/env/env.dart';
import 'package:flutter_boilerplate_mobx/service/firebase/firebase.dart';
import 'package:flutter_boilerplate_mobx/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  _initApp();
  _spyMobX();

  // TODO: Enable this code again when the issue is solved
  // https://github.com/flutter/flutter/issues/34499
  // FlutterError.onError = (details) {
  //   AppLogger.instance.e(details.exceptionAsString());
  // };

  runApp(await builder());

  await _showTrackingTransparencyPermissionDialog();
}

/// Expose what happens under MobX
void _spyMobX() {
  mainContext.config = mainContext.config.clone(
    // Enable spy only when debugging
    isSpyEnabled: !prodEnv,
  );

  mainContext.spy((event) {
    AppLogger.instance.d(event);
  });
}

/// Do all initialization here (Firebase, env, Parse...)
Future<void> _initApp() async {
  // Load variables from .env
  await dotenv.load(fileName: getConfigEnvFile());

  RestClientProvider.init();

  // Initialize Firebase
  await initFirebase();
}

Future<void> _showTrackingTransparencyPermissionDialog() async {
  await Permission.appTrackingTransparency.request();
}
