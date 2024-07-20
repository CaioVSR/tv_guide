import 'package:flutter/material.dart';
import 'package:tv_guide/core/theme/app_colors.dart';

/// The [AppElevatedButtonTheme] class defines a consistent look and feel for all `ElevatedButton`
/// widgets across the app, ensuring they adhere to the app's design guidelines.
///
class AppElevatedButtonTheme extends ElevatedButtonThemeData {
  /// Creates an instance of `AppElevatedButtonTheme`.
  ///
  /// The [context] is used to access the current theme's text styles.
  ///
  AppElevatedButtonTheme(BuildContext context)
      : super(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary),
            foregroundColor: const WidgetStatePropertyAll(AppColors.secondary),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            textStyle: WidgetStatePropertyAll(
              Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        );
}
