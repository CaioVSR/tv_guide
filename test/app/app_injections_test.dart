import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_guide/app/app_injections.dart';
import 'package:tv_guide/core/services/local_cache_service.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';

void main() {
  group('Dependency Injection Setup Verification Tests', () {
    final injector = GetIt.I;

    AppInjections.setupInjections();

    test('FlutterSecureStorage is registered', () {
      final flutterSecureStorage = injector.get<FlutterSecureStorage>();

      expect(flutterSecureStorage, isA<FlutterSecureStorage>());
    });

    test('LocalCacheService is registered', () {
      final localCacheService = injector.get<LocalCacheService>();

      expect(localCacheService, isA<LocalCacheService>());
    });

    test('UserCredentialsManager is registered', () {
      final userCredentialsManager = injector.get<UserCredentialsManager>();

      expect(userCredentialsManager, isA<UserCredentialsManager>());
    });

    test('Dio is registered', () {
      final dio = injector.get<Dio>();

      expect(dio, isA<Dio>());
      expect(dio.options.baseUrl, 'https://api.tvmaze.com');
    });
  });
}
