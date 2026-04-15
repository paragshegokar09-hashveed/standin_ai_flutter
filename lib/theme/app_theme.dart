import 'package:flutter/material.dart';

class AppColors {
  static const bg = Color(0xFF060810);
  static const bg2 = Color(0xFF0D0618);
  static const purple = Color(0xFF8B6FBF);
  static const teal = Color(0xFF00E5CC);
  static const coral = Color(0xFFE84057);
  static const amber = Color(0xFFF5A623);
  static const card = Color(0xFF0F1020);
  static const border = Color(0xFF1A1D30);
  static const textMuted = Color(0xFF6B7280);
}

class AppTextStyles {
  static const heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    letterSpacing: -0.5,
  );

  static const subheading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFFB0B8C8),
    height: 1.6,
  );

  static const label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xFF6B7280),
    letterSpacing: 0.5,
  );

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 0.3,
  );
}

class AppDecorations {
  static BoxDecoration card = BoxDecoration(
    color: AppColors.card,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.border, width: 1),
  );

  static BoxDecoration gradientButton = BoxDecoration(
    gradient: const LinearGradient(
      colors: [AppColors.purple, AppColors.teal],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: AppColors.purple.withOpacity(0.3),
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
    ],
  );

  static BoxDecoration inputField = BoxDecoration(
    color: AppColors.card,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.border, width: 1),
  );
}
