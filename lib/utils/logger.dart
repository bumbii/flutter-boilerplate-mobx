import 'package:flutter_boilerplate_mobx/env/env.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._();
  AppLogger._() {
    Logger.level = loggerLevel;

    _logger = Logger(
      printer: PrettyPrinter()
    );
  }
  static AppLogger get instance => _instance;

  static late Logger _logger;

  void i(dynamic message) {
    _logger.i(message);
  }

  void d(dynamic message) {
    _logger.d(message);
  }

  void t(dynamic message) {
    _logger.t(message);
  }

  void w(dynamic message) {
    _logger.w(message);
  }

  void e(dynamic message) {
    _logger.e(message);
  }

  void f(dynamic message) {
    _logger.f(message);
  }
}
