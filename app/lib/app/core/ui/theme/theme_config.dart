import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/colors_app.dart';

class ThemeConfig {
  ThemeConfig._();
  static final _defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey[400]!));

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black)),
    primaryColor: ColorsApp.instance.primary,
    // Material v3:
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.instance.primary,
        primary: ColorsApp.instance.primary,
        secondary: ColorsApp.instance.secondary),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.instance.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: EdgeInsets.all(13),
      border: _defaultBorder,
      enabledBorder: _defaultBorder,
      focusedBorder: _defaultBorder,
      labelStyle: TextStyles.instance.textRegular.copyWith(color: Colors.black),
      errorStyle:
          TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
