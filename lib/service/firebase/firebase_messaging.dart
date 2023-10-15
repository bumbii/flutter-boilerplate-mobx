import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_boilerplate_mobx/utils/local_storage.dart';
import 'package:flutter_boilerplate_mobx/utils/logger.dart';

Future<void> initFBMessaging() async {
  // Setup firebase messaging (notification)
  setupFirebaseMessaging();
}

Future<void> setupFirebaseMessaging() async {
  await _requestNotificationPermission();

  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions();

  /// Background:	When the application is open, however in the background (minimised).
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// In app notification listener
  /// Foreground: When the application is open, in view & in use.
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final RemoteNotification? notification = message.notification;
    // FlutterAppBadger.updateBadgeCount(1);
  });

  /// Called when a user presses a notification message displayed via FCM.
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // FlutterAppBadger.removeBadge();
    AppLogger.instance.d('A new onMessageOpenedApp event was published!');
  });
}

// TODO: Consider using this in main screen
Future<void> handleNotificationFromTerminatedApp() async {
  // The app is opened from notification received when the app is terminated.
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();
  // FlutterAppBadger.updateBadgeCount(1);
}

Future<void> _requestNotificationPermission() async {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  final NotificationSettings settings =
      await messaging.requestPermission(sound: false);

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    AppLogger.instance.d('User granted permission');
    final String? token = await messaging.getToken();
    AppLogger.instance.d('Firebase token: $token');
    // Save firebase token for later usage
    if (token != null) {
      await LocalStorage.instance.write(LocalStorage.keyFirebaseToken, token);
    }
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    AppLogger.instance.d('User granted provisional permission');
    final String? token = await messaging.getToken();
    AppLogger.instance.d('Firebase token: $token');
    if (token != null) {
      await LocalStorage.instance.write(LocalStorage.keyFirebaseToken, token);
    }
  } else {
    AppLogger.instance.w('User declined or has not accepted permission');
  }
}

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  AppLogger.instance.d('Handling a background message ${message.data}');
}
