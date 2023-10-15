import 'package:flutter_boilerplate_mobx/env/env.dart';
import 'package:flutter_boilerplate_mobx/feature/login/view/login_page.dart';
import 'package:flutter_boilerplate_mobx/feature/no_network/view/no_network_page.dart';
import 'package:flutter_boilerplate_mobx/feature/settings/view/settings_page.dart';
import 'package:flutter_boilerplate_mobx/feature/splash/view/splash_page.dart';
import 'package:go_router/go_router.dart';

// TODO: Implement Guard
class RoutePath {
  RoutePath._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String noNetwork = '/no-network';
}

final GoRouter router = GoRouter(
    initialLocation: RoutePath.splash,
    routes: [
      GoRoute(
          path: RoutePath.splash,
          builder: (context, state) {
            return const SplashPage();
          }),
      GoRoute(
          path: RoutePath.settings,
          builder: (context, state) {
            return const SettingsPage();
          }),
      GoRoute(
          path: RoutePath.login,
          builder: (context, state) {
            return const LoginPage();
          }),
      GoRoute(
          path: RoutePath.noNetwork,
          builder: (context, state) {
            return const NoNetworkPage();
          })
    ],
    debugLogDiagnostics: !prodEnv);

/// https://stackoverflow.com/questions/72976031/flutter-go-router-how-to-pass-multiple-parameters-to-other-screen
void push({required String path, Object? extra}) {
  router.push(path, extra: extra);
}

void goBack() {
  router.pop();
}

void replace({required String path}) {
  router.pushReplacement(path);
}

void go({required String path}) {
  router.go(path);
}
