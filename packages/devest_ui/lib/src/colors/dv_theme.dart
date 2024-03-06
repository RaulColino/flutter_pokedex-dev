// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

class DvTheme {
  final Color? primary;
  final Color? secondary;
  final Color? success;
  final Color? warning;
  final Color? error;
  final Color? info;
  final Color? background;
  final Color? surface100;
  final Color? surface200;
  final Color? textPrimary;
  final Color? textSecondary;
  final Color? divider;
  final Color? border;

  const DvTheme({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.background,
    required this.surface100,
    required this.surface200,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.border,
  });

  DvTheme copyWith({
    Color? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? background,
    Color? surface100,
    Color? surface200,
    Color? textPrimary,
    Color? textSecondary,
    Color? divider,
    Color? border,
  }) {
    return DvTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      background: background ?? this.background,
      surface100: surface100 ?? this.surface100,
      surface200: surface200 ?? this.surface200,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      divider: divider ?? this.divider,
      border: border ?? this.border,
    );
  }
}
