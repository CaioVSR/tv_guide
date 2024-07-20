import 'package:get_it/get_it.dart';
import 'package:tv_guide/features/home/data/repositories/user_repository_impl.dart';
import 'package:tv_guide/features/home/domain/repositories/user_repository.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';
import 'package:tv_guide/features/home/presentation/cubit/home_page_cubit.dart';

/// The [HomeFeatureSetup] for setting up the dependency injections for the Splash feature.
///
/// This class uses the `GetIt` package to register the necessary data sources,
/// repositories, and use cases required by the Splash feature.
class HomeFeatureSetup {
  /// Private constructor to prevent instantiation of this class.
  const HomeFeatureSetup._();

  /// Sets up the dependency injections for the Splash feature.
  ///
  /// This method registers the following dependencies:
  /// - [CacheDataSource]: The data source for fetching user credentials from the local cache.
  /// - [SplashRepository]: The repository for managing user credentials.
  /// - [UserIsLoggedUseCase]: The use case for checking if the user is logged in.
  ///
  /// Example usage:
  /// ```dart
  /// AuthFeatureSetup.setupInjections();
  /// ```
  static void setupInjections() {
    GetIt.I
      // DATA SOURCES

      // REPOSITORIES
      ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(GetIt.I.get()))

      // USE CASES
      ..registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(GetIt.I.get()))

      // CUBITS
      ..registerLazySingleton<HomePageCubit>(() => HomePageCubit(GetIt.I.get()));
  }
}
