import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_guide/core/services/local_cache_service.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';
import 'package:tv_guide/features/splash/splash_feature_setup.dart';

/// The [AppInjections] class is responsible for setting up dependency injections for the app.
class AppInjections {
  /// Private constructor to prevent instantiation of this class.
  const AppInjections._();

  /// Sets up the dependency injections for the application.
  ///
  /// This method registers the dependencies used across the application.
  ///
  static Future<void> setupInjections() async {
    // COMMON INJECTIONS
    GetIt.I
      ..registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage())
      ..registerSingleton<LocalCacheService>(LocalCacheService(GetIt.I.get()))
      ..registerSingleton<UserCredentialsManager>(UserCredentialsManager(GetIt.I.get()));

    // FEATURE-SPECIFIC INJECTIONS
    SplashFeatureSetup.setupInjections();
  }
}
