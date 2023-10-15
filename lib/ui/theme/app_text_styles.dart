import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_colors.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_dimens.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_themes.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle buttonText = const TextStyle(
      color: AppColors.primary,
      fontFamily: defaultFontFamily,
      fontSize: AppDimens.buttonTextSize,
      fontWeight: FontWeight.w700);

  static const TextStyle headlineLarge = TextStyle(
      color: AppColors.white,
      fontFamily: defaultFontFamily,
      fontSize: AppDimens.headlineLarge,
      fontWeight: FontWeight.w900);

  static const TextStyle headlineMedium = TextStyle(
      color: AppColors.white,
      fontFamily: defaultFontFamily,
      fontSize: AppDimens.headlineMedium,
      fontWeight: FontWeight.w700);

  static const TextStyle headlineSmall = TextStyle(
      color: AppColors.white,
      fontFamily: defaultFontFamily,
      fontSize: AppDimens.headlineSmall,
      fontWeight: FontWeight.w700);

  static const TextStyle errorText = TextStyle(
      color: AppColors.error,
      fontFamily: defaultFontFamily,
      fontWeight: FontWeight.w400);

  static const TextStyle titleLarge = TextStyle(
      color: AppColors.black,
      fontSize: AppDimens.titleTextSize,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily);

  static const TextStyle displayMedium = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: AppDimens.headerTextSize,
      fontFamily: defaultFontFamily);

  static const TextStyle bodyMedium = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontSize: AppDimens.bodyTextSize,
      fontFamily: defaultFontFamily);

  static const TextStyle labelLarge = TextStyle(
      color: AppColors.black,
      fontSize: AppDimens.buttonTextSize,
      fontWeight: FontWeight.w600,
      fontFamily: defaultFontFamily);

  static const TextStyle noNetworkTitle = TextStyle(
      color: AppColors.red,
      fontSize: AppDimens.noNetworkTitleTextSize,
      fontWeight: FontWeight.w700,
      fontFamily: defaultFontFamily);
}
