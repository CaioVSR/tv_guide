import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_guide/app/app_injections.dart';
import 'package:tv_guide/features/splash/data/local_data_source/cache_data_source.dart';
import 'package:tv_guide/features/splash/data/repositories/splash_repository_impl.dart';
import 'package:tv_guide/features/splash/domain/repositories/splash_repository.dart';
import 'package:tv_guide/features/splash/domain/use_cases/user_is_logged_use_case.dart';
import 'package:tv_guide/features/splash/presentation/cubit/splash_page_cubit.dart';
import 'package:tv_guide/features/splash/splash_feature_setup.dart';

void main() {
  group('Auth Feature Setup Injection Tests', () {
    final injector = GetIt.I;

    setUpAll(() {
      AppInjections.setupInjections();
      SplashFeatureSetup.setupInjections();
    });

    test('Check if all instances where injected', () {
      final cacheDataSource = injector.get<CacheDataSource>();
      final splashRepository = injector.get<SplashRepository>();
      final userIsLoggedUseCase = injector.get<UserIsLoggedUseCase>();
      final splashPageCubit = injector.get<SplashPageCubit>();

      expect(cacheDataSource, isA<CacheDataSource>());
      expect(cacheDataSource, isA<CacheDataSourceImpl>());
      expect(splashRepository, isA<SplashRepository>());
      expect(splashRepository, isA<SplashRepositoryImpl>());
      expect(userIsLoggedUseCase, isA<UserIsLoggedUseCase>());
      expect(splashPageCubit, isA<SplashPageCubit>());
    });

    test('Check if the injections where disposed properly', () async {
      await SplashFeatureSetup.dispose();

      expect(injector.isRegistered<CacheDataSource>(), isFalse);
      expect(injector.isRegistered<SplashRepository>(), isFalse);
      expect(injector.isRegistered<UserIsLoggedUseCase>(), isFalse);
      expect(injector.isRegistered<SplashPageCubit>(), isFalse);
    });
  });
}
