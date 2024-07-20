import 'package:flutter/material.dart';
import 'package:tv_guide/core/theme/app_colors.dart';

/// Custom theme for the AppBar.
///
/// The [CustomAppBarTheme] class extends [AppBarTheme] and sets a custom background color
/// for the AppBar using the [AppColors] defined in the application theme.
class CustomAppBarTheme extends AppBarTheme {
  /// Creates an instance of [CustomAppBarTheme].
  ///
  /// The constructor sets the background color of the AppBar to the color defined in [AppColors.background].
  const CustomAppBarTheme() : super(backgroundColor: AppColors.background);
}
