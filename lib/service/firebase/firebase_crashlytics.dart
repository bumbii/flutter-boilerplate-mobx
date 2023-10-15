import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void recordErrorToFirebase(dynamic exception, StackTrace? stackTrace,
    {dynamic reason}) {
  FirebaseCrashlytics.instance.recordError(exception, stackTrace);
}