import 'package:go_router/go_router.dart';
import 'package:tv_guide/app/app_route_manager.dart';
import 'package:tv_guide/features/auth/auth_feature_setup.dart';
import 'package:tv_guide/features/auth/presentation/pages/login_page.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';
import 'package:tv_guide/features/home/home_feature_setup.dart';
import 'package:tv_guide/features/home/presentation/pages/details_page.dart';
import 'package:tv_guide/features/home/presentation/pages/home_page/home_page.dart';
import 'package:tv_guide/features/splash/presentation/pages/splash_page.dart';
import 'package:tv_guide/features/splash/splash_feature_setup.dart';

/// The [AppRouter] class is responsible for setting up the application's routing configuration.
///
/// This class defines the routes used throughout the application and their respective settings.
///
class AppRouter {
  const AppRouter._();

  /// The router configuration for the application.
  ///
  /// This configuration includes all the routes and their respective settings
  /// used throughout the application.
  ///
  /// Routes:
  /// - Splash Page: The initial route ("/") which displays the splash screen.
  /// - Login Page: The route ("/login") for the login screen.
  /// - Home Page: The route ("/home") for the home screen.
  ///   - Show Details Page: The nested route ("/home/showDetails") for displaying show
  ///
  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteManager.splashRouteName,
        path: '/',
        builder: (context, state) {
          SplashFeatureSetup.setupInjections();

          return const SplashPage();
        },
      ),
      GoRoute(
        name: AppRouteManager.loginRouteName,
        path: '/${AppRouteManager.loginRouteName}',
        builder: (context, state) {
          AuthFeatureSetup.setupInjections();

          return const LoginPage();
        },
      ),
      GoRoute(
        name: AppRouteManager.homeRouteName,
        path: '/${AppRouteManager.homeRouteName}',
        builder: (context, state) {
          HomeFeatureSetup.setupInjections();

          return const HomePage();
        },
        onExit: (context, state) async {
          await HomeFeatureSetup.dispose();
          return true;
        },
        routes: [
          GoRoute(
            name: AppRouteManager.showDetailsRouteName,
            path: '$AppRouteManager.showDetailsRouteName',
            builder: (context, state) => DetailsPage(details: state.extra! as ShowEntity),
          ),
        ],
      ),
    ],
  );
}
