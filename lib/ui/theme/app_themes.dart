import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_mobx/assets/fonts/fonts.dart';
import 'package:flutter_boilerplate_mobx/enum/app_theme.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_colors.dart';
import 'package:flutter_boilerplate_mobx/ui/theme/app_text_styles.dart';

const String defaultFontFamily = Fonts.baiJamjuree;

final Map<AppTheme, ThemeData> appThemes = {
  AppTheme.dark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      colorScheme: const ColorScheme(
        background: AppColors.background,
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
      ),
      fontFamily: defaultFontFamily,
      iconTheme: const IconThemeData(color: AppColors.iconTheme),
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.transparent),
      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        // title
        displayMedium: AppTextStyles.displayMedium,
        // header
        bodyMedium: AppTextStyles.bodyMedium,
        // body
        labelLarge: AppTextStyles.labelLarge, // button
      )),
  AppTheme.light: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.grey,
      colorScheme: const ColorScheme(
        background: AppColors.background,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
      ),
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.transparent),
      fontFamily: defaultFontFamily,
      iconTheme: const IconThemeData(color: AppColors.iconTheme),
      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        headlineSmall: AppTextStyles.headlineSmall,
        titleLarge: AppTextStyles.titleLarge,
        // title
        displayMedium: AppTextStyles.displayMedium,
        // header
        bodyMedium: AppTextStyles.bodyMedium,
        // body
        labelLarge: AppTextStyles.labelLarge, // button
      )),
};
