import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_guide/app/app_router.dart';
import 'package:tv_guide/core/theme/app_colors.dart';
import 'package:tv_guide/core/theme/app_elevated_button_theme.dart';
import 'package:tv_guide/core/theme/app_input_decoration_theme.dart';

/// A root widget for the application.
///
/// This widget is responsible for setting up the application's routing and theme.
/// It uses the `MaterialApp.router` constructor to integrate with the app's routing
/// setup, which is defined in `AppRouter.routerConfig`. This approach allows for
/// deep linking and navigation without the need to manually manage the navigation
/// stack.
///
class AppWidget extends StatelessWidget {
  /// Creates a new instance of the [AppWidget].
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tv Guide',
      routerConfig: AppRouter.routerConfig,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        elevatedButtonTheme: AppElevatedButtonTheme(context),
        inputDecorationTheme: AppInputDecorationTheme(context),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.primaryVariant),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
