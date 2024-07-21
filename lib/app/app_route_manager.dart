import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';

/// A utility class for managing app routes using the `go_router` package.
///
/// This class defines a set of static constants representing the named routes
/// within the application. It also provides an extension on `BuildContext` to
/// facilitate easy navigation between these routes.
///
/// Routes:
/// - `splash`: Represents the splash screen route.
/// - `login`: Represents the login screen route.
/// - `home`: Represents the home screen route.
/// - `showDetails`: Represents the details screen route.
///
class AppRouteManager {
  const AppRouteManager._();
  
  /// The named route for the splash screen.
  static const String splashRouteName = 'splash';

  /// The named route for the login screen.
  static const String loginRouteName = 'login';

  /// The named route for the home screen.
  static const String homeRouteName = 'home';

  /// The named route for the details screen.
  static const String showDetailsRouteName = 'showDetails';
}

/// The extension `AppRouteManagerX` adds methods to `BuildContext` for navigating
/// to the routes defined in `AppRouteManager`. This approach allows for type-safe
/// navigation without the need to remember or mistype route names as strings.
///
/// Usage:
/// To navigate to a route, use the context from a widget to call the appropriate
/// method. For example, to navigate to the login screen, you would use:
/// 
/// ```dart
/// context.goToLogin();
/// ```
///
extension AppRouteManagerX on BuildContext {
  /// Navigates to the splash screen.
  void goToSplash() => goNamed(AppRouteManager.splashRouteName);

  /// Navigates to the login screen.
  void goToLogin() => goNamed(AppRouteManager.loginRouteName);

  /// Navigates to the home screen.
  void goToHome() => goNamed(AppRouteManager.homeRouteName);

  /// Navigates to the details screen with the provided details.
  void goToShowDetails(ShowEntity details) => goNamed(AppRouteManager.showDetailsRouteName, extra: details);
}
