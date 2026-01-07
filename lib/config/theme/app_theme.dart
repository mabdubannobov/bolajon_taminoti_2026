import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Paketni ulaymiz
import '../../core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary500,
      scaffoldBackgroundColor: AppColors.grey50, // Orqa fon
      // Rang sxemasi
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary500,
        secondary: AppColors.secondary500,
        error: AppColors.error,
        surface: Colors.white,
        onSurface: AppColors.grey900, // Matn rangi
      ),

      // MATN STILLARI (Typography rasmiga asoslanib)
      // GoogleFonts.urbanistTextTheme() bizga Urbanist shriftini beradi
      textTheme: GoogleFonts.urbanistTextTheme(
        const TextTheme(
          // --- Headings ---
          displayLarge: TextStyle(
            // H1
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
          displayMedium: TextStyle(
            // H2
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
          displaySmall: TextStyle(
            // H3
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
          headlineMedium: TextStyle(
            // H4
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
          headlineSmall: TextStyle(
            // H5
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),
          titleLarge: TextStyle(
            // H6
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.grey900,
          ),

          // --- Body ---
          bodyLarge: TextStyle(
            // Body XL (18px)
            fontSize: 18,
            fontWeight: FontWeight.w500, // Medium yoki Regular
            color: AppColors.grey800,
          ),
          bodyMedium: TextStyle(
            // Body Large (16px) - Asosiy matn
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.grey800,
          ),
          bodySmall: TextStyle(
            // Body Medium (14px)
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.grey600, // Yordamchi rang
          ),
          labelLarge: TextStyle(
            // Body Small (12px)
            fontSize: 12,
            fontWeight: FontWeight.w600, // Boldroq
            color: AppColors.grey600,
          ),
        ),
      ),

      // Input (Forma) dizayni
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grey100, // Rasmda input foni och kulrang
        hintStyle: GoogleFonts.urbanist(
          // Hint ham Urbanist bo'lsin
          color: AppColors.grey500,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary500, width: 1),
        ),
      ),
    );
  }
}
