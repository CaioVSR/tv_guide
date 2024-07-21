import 'package:get_it/get_it.dart';
import 'package:tv_guide/features/auth/data/local_data_source/auth_local_data_source.dart';
import 'package:tv_guide/features/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:tv_guide/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tv_guide/features/auth/domain/repositories/auth_repository.dart';
import 'package:tv_guide/features/auth/domain/use_cases/authenticate_use_case.dart';
import 'package:tv_guide/features/auth/presentation/cubit/login_cubit.dart';
import 'package:tv_guide/features/auth/presentation/cubit/visibility_cubit.dart';

/// The [AuthFeatureSetup] class sets up the dependency injections for the Auth feature.
///
/// This class uses the `GetIt` package to register the necessary data sources,
/// repositories, and use cases required by the Auth feature.
class AuthFeatureSetup {
  /// Private constructor to prevent instantiation of this class.
  const AuthFeatureSetup._();

  /// Sets up the dependency injections for the Auth feature.
  ///
  /// This method registers the following dependencies:
  /// - [AuthLocalDataSource]: The data source for fetching user credentials from the local cache.
  /// - [AuthRemoteDataSource]: The data source for fetching user credentials from the remote server.
  /// - [AuthRepository]: The repository for managing user credentials.
  /// - [AuthenticateUseCase]: The use case for authenticating a user.
  /// - [VisibilityCubit]: The cubit for managing the visibility of the password field.
  /// - [LoginCubit]: The cubit for managing the login state.
  ///
  /// Example usage:
  /// ```dart
  /// AuthFeatureSetup.setupInjections();
  /// ```
  static void setupInjections() {
    GetIt.I
      ..pushNewScope()
      // DATA SOURCES
      ..registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(GetIt.I.get()))
      ..registerLazySingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl.new)

      // REPOSITORIES
      ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(GetIt.I.get(), GetIt.I.get()))

      // USE CASES
      ..registerLazySingleton<AuthenticateUseCase>(() => AuthenticateUseCase(GetIt.I.get()))

      // CUBITS
      ..registerLazySingleton<VisibilityCubit>(VisibilityCubit.new)
      ..registerLazySingleton<LoginCubit>(() => LoginCubit(GetIt.I.get()));
  }

  /// Disposes of the current scope of the dependency injections.
  ///
  /// This method pops the current scope from the stack, cleaning up any dependencies
  /// that were registered within that scope.
  static Future<void> dispose() async {
    await GetIt.I.popScope();
  }
}
