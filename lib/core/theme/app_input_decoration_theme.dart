import 'package:flutter/material.dart';
import 'package:tv_guide/core/theme/app_colors.dart';

/// The [AppInputDecorationTheme] class defines a consistent look and feel for all `Input`
/// widgets across the app, ensuring they adhere to the app's design guidelines.
///
class AppInputDecorationTheme extends InputDecorationTheme {
  /// Creates an instance of `AppInputDecorationTheme`.
  ///
  /// The [context] is used to access the current theme's text styles.
  ///
  AppInputDecorationTheme(BuildContext context)
      : super(
          floatingLabelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.textSecondary),
          fillColor: Colors.transparent,
          filled: true,
          labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          suffixIconColor: AppColors.textSecondary,
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.error,
              ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textSecondary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textSecondary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textSecondary),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
}
