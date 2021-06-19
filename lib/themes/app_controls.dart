import 'dart:ui';
import 'package:iherb_helper/themes/colors.dart';
import 'package:flutter/material.dart';

/// служебный класс для темы приложения
class AppControlsThemeData {
  final Color checkboxBorderColor;
  final Color checkboxBackgroundColor;
  final Color labelTextColor;

  const AppControlsThemeData({
    @required this.checkboxBorderColor,
    @required this.checkboxBackgroundColor,
    @required this.labelTextColor,
  });
}

const formAppControlsThemeData = AppControlsThemeData(
  checkboxBorderColor: mainbossTextGrey,
  checkboxBackgroundColor: mainbossTextDialogWhite,
  labelTextColor: mainbossTextDarkGrey,
);

const signUpAppControlsThemeData = AppControlsThemeData(
  checkboxBorderColor: mainbossTextDialogWhite,
  checkboxBackgroundColor: Colors.transparent,
  labelTextColor: mainbossTextDialogWhite,
);
