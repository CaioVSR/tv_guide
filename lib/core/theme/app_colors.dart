import 'package:flutter/material.dart';

/// The [AppColors] class contains the color constants used throughout the app.
///
/// This class provides a centralized location for defining all the colors used
/// in the app, ensuring a consistent and cohesive color scheme.
class AppColors {
  /// Private constructor to prevent instantiation of this class.
  const AppColors._();

  /// PRIMARY COLORS

  /// The primary color of the app, used for app bars, buttons, etc.
  static const Color primary = Color(0xFF0A84FF);

  /// A darker variant of the primary color, used for emphasis.
  static const Color primaryVariant = Color(0xFF0066CC);

  /// SECONDARY COLORS

  /// The secondary color of the app, used for elements that need to contrast with the primary color.
  static const Color secondary = Color(0xFFFFFFFF);

  /// A lighter variant of the secondary color, used for backgrounds and surfaces.
  static const Color secondaryVariant = Color(0xFFF0F0F0);

  /// ACCENT COLORS

  /// A bright accent color, used for highlights and interactive elements.
  static const Color accent = Color(0xFFFFC107); // Amber

  /// Another accent color, used for secondary highlights.
  static const Color accentVariant = Color(0xFFFF5722); // Deep Orange

  /// TEXT COLORS

  /// The primary text color, used for main content.
  static const Color textPrimary = Color(0xFF000000);

  /// A secondary text color, used for less prominent text.
  static const Color textSecondary = Color(0xFF757575);

  /// BACKGROUND COLORS

  /// The main background color of the app.
  static const Color background = Color(0xffeef3f5);

  /// A variant background color, used for cards and surfaces.
  static const Color backgroundVariant = Color(0xFFF5F5F5);

  /// ERROR COLORS

  /// The error color, used for indicating errors and important warnings.
  static const Color error = Color(0xFFB00020);

  /// SUCCESS COLORS

  /// The color used to indicate success.
  static const Color success = Color(0xFF4CAF50); // Green

  /// WARNING COLORS

  /// The color used to indicate warnings.
  static const Color warning = Color(0xFFFFEB3B); // Yellow

  /// INFO COLORS

  /// The color used to indicate informational messages.
  static const Color info = Color(0xFF2196F3); // Blue
}
