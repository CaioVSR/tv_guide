import 'package:get_it/get_it.dart';
import 'package:tv_guide/features/splash/data/local_data_source/cache_data_source.dart';
import 'package:tv_guide/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:tv_guide/features/splash/domain/repositories/splash_repository.dart';
import 'package:tv_guide/features/splash/domain/use_cases/user_is_logged_use_case.dart';
import 'package:tv_guide/features/splash/presentation/cubit/splash_page_cubit.dart';

/// The [SplashFeatureSetup] for setting up the dependency injections for the Splash feature.
///
/// This class uses the `GetIt` package to register the necessary data sources,
/// repositories, and use cases required by the Splash feature.
class SplashFeatureSetup {
  /// Private constructor to prevent instantiation of this class.
  const SplashFeatureSetup._();

  /// Sets up the dependency injections for the Splash feature.
  ///
  /// This method registers the following dependencies:
  /// - [CacheDataSource]: The data source for fetching user credentials from the local cache.
  /// - [SplashRepository]: The repository for managing user credentials.
  /// - [UserIsLoggedUseCase]: The use case for checking if the user is logged in.
  ///
  /// Example usage:
  /// ```dart
  /// SplashFeatureSetup.setupInjections();
  /// ```
  static void setupInjections() {
    GetIt.I
      ..pushNewScope()
      // DATA SOURCES
      ..registerLazySingleton<CacheDataSource>(() => CacheDataSourceImpl(GetIt.I.get()))

      // REPOSITORIES
      ..registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(GetIt.I.get()))

      // USE CASES
      ..registerLazySingleton<UserIsLoggedUseCase>(() => UserIsLoggedUseCase(GetIt.I.get()))

      // CUBITS
      ..registerLazySingleton<SplashPageCubit>(() => SplashPageCubit(GetIt.I.get()));
  }

  /// Disposes of the current scope of the dependency injections.
  ///
  /// This method pops the current scope from the stack, cleaning up any dependencies
  /// that were registered within that scope.
  static Future<void> dispose() async {
    await GetIt.I.popScope();
  }
}
