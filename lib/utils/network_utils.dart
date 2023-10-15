import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_boilerplate_mobx/router/router.dart';

/// Check if the device has network connection or not
Future<bool> hasNetworkConnection() async {
  final connectivityResult = await (Connectivity().checkConnectivity());

  return [
    ConnectivityResult.ethernet,
    ConnectivityResult.mobile,
    ConnectivityResult.wifi,
    ConnectivityResult.other
  ].contains(connectivityResult);
}

/// Handle no network case. Feel free to implement your own UI flow.
Future<void> handleNoNetworkConnection() async {
  bool hasNetwork = await hasNetworkConnection();
  if (!hasNetwork) {
    go(path: RoutePath.noNetwork);
  }
}
