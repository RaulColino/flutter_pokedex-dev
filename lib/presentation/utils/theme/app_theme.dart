import 'package:devest_ui/devest_ui.dart';
import 'package:flutter/material.dart';

final _defaultTheme = DvTheme(
    primary: const Color(0xFFCC0000), //Boston University Red
    secondary: Colors.blueGrey[200],
    success: Colors.green,
    warning: Colors.yellow,
    error: Colors.red,
    info: Colors.blue,
    background: Colors.white,
    surface100: Colors.white,
    surface200: Colors.grey[100],
    textPrimary: Colors.black,
    textSecondary: const Color(0xFF808080),
    divider: Colors.grey[300],
    border: Colors.grey[300],
  );

class AppTheme {
  static final original = _defaultTheme;
  static final bug = _defaultTheme.copyWith(primary: const Color(0xFF94BC4A));
  static final dark = _defaultTheme.copyWith(primary: const Color(0xFF736C75));
  static final dragon = _defaultTheme.copyWith(primary: const Color(0xFF6A7BAF));
  static final electric = _defaultTheme.copyWith(primary: const Color(0xFFE5C531));
  static final fairy = _defaultTheme.copyWith(primary: const Color(0xFFE397D1));
  static final fighting = _defaultTheme.copyWith(primary: const Color(0xFFCB5F48));
  static final fire = _defaultTheme.copyWith(primary: const Color(0xFFEA7A3C));
  static final flying = _defaultTheme.copyWith(primary: const Color(0xFF7DA6DE));
  static final ghost = _defaultTheme.copyWith(primary: const Color(0xFF846AB6));
  static final grass = _defaultTheme.copyWith(primary: const Color(0xFF71C558));
  static final ground = _defaultTheme.copyWith(primary: const Color(0xFFCC9F4F));
  static final ice = _defaultTheme.copyWith(primary: const Color(0xFF70CBD4));
  static final normal = _defaultTheme.copyWith(primary: const Color(0xFFAAB09F));
  static final poison = _defaultTheme.copyWith(primary: const Color(0xFFB468B7));
  static final psychic = _defaultTheme.copyWith(primary: const Color(0xFFE5709B));
  static final rock = _defaultTheme.copyWith(primary: const Color(0xFFB2A061));
  static final steel = _defaultTheme.copyWith(primary: const Color(0xFF89A1B0));
  static final water = _defaultTheme.copyWith(primary: const Color(0xFF539AE2));
}