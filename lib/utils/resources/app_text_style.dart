
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as inter;

abstract final class AppTextStyle {
  static final inter.TextStyle bodyLarge = inter.TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final inter.TextStyle bodyMedium = inter.TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final inter.TextStyle bodySmall = inter.TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final inter.TextStyle titleLarge = inter.TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}