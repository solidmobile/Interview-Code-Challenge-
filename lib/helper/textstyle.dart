import 'package:flutter/material.dart';

import 'constant.dart';

// Primary Text Style
TextStyle primaryTextStyle({
  int size,
  Color color,
  FontWeight weight = FontWeight.normal,
  String fontFamily,
  double letterSpacing,
  FontStyle fontStyle,
  double wordSpacing,
  TextDecoration decoration,
  TextDecorationStyle textDecorationStyle,
  TextBaseline textBaseline,
  Color decorationColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : 16,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
  );
}

// Bold Text Style
TextStyle boldTextStyle({
  int size,
  Color color,
  FontWeight weight = FontWeight.bold,
  String fontFamily,
  double letterSpacing,
  FontStyle fontStyle,
  double wordSpacing,
  TextDecoration decoration,
  TextDecorationStyle textDecorationStyle,
  TextBaseline textBaseline,
  Color decorationColor,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : 16,
    color: color ?? textPrimaryColorGlobal,
    fontWeight: weight,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
  );
}