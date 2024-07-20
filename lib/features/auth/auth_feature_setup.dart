import 'package:get_it/get_it.dart';
import 'package:tv_guide/features/auth/data/local_data_source/auth_local_data_source.dart';
import 'package:tv_guide/features/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:tv_guide/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tv_guide/features/auth/domain/repositories/auth_repository.dart';
import 'package:tv_guide/features/auth/domain/use_cases/authenticate_use_case.dart';
import 'package:tv_guide/features/auth/presentation/cubit/login_cubit.dart';
import 'package:tv_guide/features/auth/presentation/cubit/visibility_cubit.dart';

/// The [AuthFeatureSetup] for setting up the dependency injections for the Splash feature.
///
/// This class uses the `GetIt` package to register the necessary data sources,
/// repositories, and use cases required by the Splash feature.
class AuthFeatureSetup {
  /// Private constructor to prevent instantiation of this class.
  const AuthFeatureSetup._();

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
      ..registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(GetIt.I.get()))
      ..registerLazySingleton<AuthRemoteDataSource>( AuthRemoteDataSourceImpl.new)

      // REPOSITORIES
      ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(GetIt.I.get(), GetIt.I.get()))

      // USE CASES
      ..registerLazySingleton<AuthenticateUseCase>(() => AuthenticateUseCase(GetIt.I.get()))

      // CUBITS
      ..registerLazySingleton<VisibilityCubit>(VisibilityCubit.new)
      ..registerLazySingleton<LoginCubit>(() => LoginCubit(GetIt.I.get()));
  }
}
