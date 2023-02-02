import 'dart:ui';

import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'mplus1';

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.w700, fontFamily: font);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w900, fontFamily: font);

  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}