import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_boilerplate_mobx/service/firebase/firebase_messaging.dart';
import 'package:flutter_boilerplate_mobx/service/firebase/firebase_options.dart';
import 'package:flutter_boilerplate_mobx/service/firebase/firebase_performance.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initFBMessaging();
  await initFirebasePerformance();
}
