import 'package:get_it/get_it.dart';
import 'package:tv_guide/features/home/data/remote_data_source/shows_data_source.dart';
import 'package:tv_guide/features/home/data/repositories/shows_repository_impl.dart';
import 'package:tv_guide/features/home/data/repositories/user_repository_impl.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';
import 'package:tv_guide/features/home/domain/repositories/user_repository.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_shows_use_case.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';
import 'package:tv_guide/features/home/presentation/cubit/home_page_cubit.dart';

/// The [HomeFeatureSetup] for setting up the dependency injections for the Home feature.
///
/// This class uses the `GetIt` package to register the necessary data sources,
/// repositories, and use cases required by the Home feature.
class HomeFeatureSetup {
  /// Private constructor to prevent instantiation of this class.
  const HomeFeatureSetup._();

  /// Sets up the dependency injections for the Home feature.
  ///
  /// This method registers the following dependencies:
  /// - [ShowsDataSource]: The data source for fetching show data from the remote server.
  /// - [UserRepository]: The repository for managing user credentials.
  /// - [ShowsRepository]: The repository for managing show data.
  /// - [LogOutUseCase]: The use case for logging out the user.
  /// - [FetchShowsUseCase]: The use case for fetching shows.
  /// - [HomePageCubit]: The cubit for managing the home page state.
  ///
  /// Example usage:
  /// ```dart
  /// HomeFeatureSetup.setupInjections();
  /// ```
  static void setupInjections() {
    GetIt.I
      ..pushNewScope()
      // DATA SOURCES
      ..registerLazySingleton<ShowsDataSource>(() => ShowsDataSourceImpl(GetIt.I.get()))

      // REPOSITORIES
      ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(GetIt.I.get()))
      ..registerLazySingleton<ShowsRepository>(() => ShowsRepositoryImpl(GetIt.I.get()))

      // USE CASES
      ..registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(GetIt.I.get()))
      ..registerLazySingleton<FetchShowsUseCase>(() => FetchShowsUseCase(GetIt.I.get()))

      // CUBITS
      ..registerLazySingleton<HomePageCubit>(() => HomePageCubit(GetIt.I.get(), GetIt.I.get()));
  }

  /// Disposes of the current scope of the dependency injections.
  ///
  /// This method pops the current scope from the stack, cleaning up any dependencies
  /// that were registered within that scope.
  static Future<void> dispose() async {
    await GetIt.I.popScope();
  }
}
