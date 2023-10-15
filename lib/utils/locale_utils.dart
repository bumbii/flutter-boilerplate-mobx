import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mobx/enum/app_languages.dart';

Locale getAppLocale({AppLanguage appLanguage = AppLanguage.en}) {
  return Locale(appLanguage.name);
}