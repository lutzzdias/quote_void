import 'package:flutter/material.dart';
import 'package:quote_void/src/constants/app_sizes.dart';

// TODO: Create and follow a design system (textStyle)
class AppTextStyle {
  static const title = TextStyle(
    fontSize: Sizes.p32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const titleSmall = TextStyle(
    fontSize: Sizes.p24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const titleSmallWhite = TextStyle(
    fontSize: Sizes.p24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const subtitle = TextStyle(
    fontSize: Sizes.p20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const subtitleBold = TextStyle(
    fontSize: Sizes.p20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const subtitleTranslucent = TextStyle(
    fontSize: Sizes.p20,
    fontWeight: FontWeight.normal,
    color: Colors.black45,
  );

  static const body = TextStyle(
    fontSize: Sizes.p16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const bodyTranslucent = TextStyle(
    fontSize: Sizes.p16,
    fontWeight: FontWeight.normal,
    color: Colors.black45,
  );

  static const link = TextStyle(
    fontSize: Sizes.p16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    decoration: TextDecoration.underline,
  );

  static const linkBold = TextStyle(
    fontSize: Sizes.p16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    decoration: TextDecoration.underline,
  );

  static const tag = TextStyle(
    fontSize: Sizes.p12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final error = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 13,
    color: Colors.red[700],
    height: 0.5,
  );
}
