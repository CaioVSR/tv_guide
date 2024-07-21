import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_guide/app/app_injections.dart';
import 'package:tv_guide/features/home/data/remote_data_source/shows_data_source.dart';
import 'package:tv_guide/features/home/data/repositories/user_repository_impl.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';
import 'package:tv_guide/features/home/domain/repositories/user_repository.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_show_use_case.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_shows_use_case.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';
import 'package:tv_guide/features/home/home_feature_setup.dart';
import 'package:tv_guide/features/home/presentation/cubit/home_page_cubit.dart';

void main() {
  group('Auth Feature Setup Injection Tests', () {
    final injector = GetIt.I;

    setUpAll(() {
      AppInjections.setupInjections();
      HomeFeatureSetup.setupInjections();
    });

    test('Check if all instances where injected', () {
      final showsDataSource = injector.get<ShowsDataSource>();
      final userRepository = injector.get<UserRepository>();
      final showsRepository = injector.get<ShowsRepository>();
      final logOutUseCase = injector.get<LogOutUseCase>();
      final fetchShowsUseCase = injector.get<FetchShowsUseCase>();
      final fetchShowUseCase = injector.get<FetchShowUseCase>();
      final homePageCubit = injector.get<HomePageCubit>();

      expect(showsDataSource, isA<ShowsDataSource>());
      expect(showsDataSource, isA<ShowsDataSourceImpl>());
      expect(userRepository, isA<UserRepository>());
      expect(userRepository, isA<UserRepositoryImpl>());
      expect(showsRepository, isA<ShowsRepository>());
      expect(logOutUseCase, isA<LogOutUseCase>());
      expect(fetchShowsUseCase, isA<FetchShowsUseCase>());
      expect(fetchShowUseCase, isA<FetchShowUseCase>());
      expect(homePageCubit, isA<HomePageCubit>());
    });

    test('Check if the injections where disposed properly', () async {
      await HomeFeatureSetup.dispose();

      expect(injector.isRegistered<ShowsDataSource>(), isFalse);
      expect(injector.isRegistered<UserRepository>(), isFalse);
      expect(injector.isRegistered<ShowsRepository>(), isFalse);
      expect(injector.isRegistered<LogOutUseCase>(), isFalse);
      expect(injector.isRegistered<FetchShowsUseCase>(), isFalse);
      expect(injector.isRegistered<FetchShowUseCase>(), isFalse);
      expect(injector.isRegistered<HomePageCubit>(), isFalse);
    });
  });
}
