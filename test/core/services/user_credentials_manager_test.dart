import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/core/services/local_cache_service.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';

class MockLocalCacheService extends Mock implements LocalCacheService {}

void main() {
  late MockLocalCacheService mockLocalCacheService;
  late UserCredentialsManager userCredentialsManager;

  setUp(() {
    mockLocalCacheService = MockLocalCacheService();
    userCredentialsManager = UserCredentialsManager(mockLocalCacheService);
  });

  tearDown(() {
    reset(mockLocalCacheService);
  });

  group('UserCredentialsManager', () {
    test('loadUserCredentials should load and set user credentials', () async {
      final jsonString = json.encode({
        'user_name': 'Test User',
        'jwt': 'some-jwt-token',
      });

      when(() => mockLocalCacheService.read(key: any(named: 'key'))).thenAnswer((_) async => Future.value(jsonString));

      await userCredentialsManager.loadUserCredentials();

      expect(userCredentialsManager.userCredentials, isNotNull);
      expect(userCredentialsManager.userCredentials?.userName, 'Test User');
      expect(userCredentialsManager.userCredentials?.jwt, 'some-jwt-token');
      verify(() => mockLocalCacheService.read(key: any(named: 'key'))).called(1);
      verifyNoMoreInteractions(mockLocalCacheService);
    });

    test('loadUserCredentials should load some corrupted data, deleting the cache data', () async {
      const corruptedJson = 'corrupted-json';

      when(() => mockLocalCacheService.read(key: any(named: 'key')))
          .thenAnswer((_) async => Future.value(corruptedJson));

      when(() => mockLocalCacheService.delete(key: any(named: 'key'))).thenAnswer((_) async => Future.value());

      await userCredentialsManager.loadUserCredentials();

      expect(userCredentialsManager.userCredentials, isNull);
      verify(() => mockLocalCacheService.read(key: any(named: 'key'))).called(1);
      verify(() => mockLocalCacheService.delete(key: any(named: 'key'))).called(1);
      verifyNoMoreInteractions(mockLocalCacheService);
    });

    test('loadUserCredentials should load some empty data, deleting the cache data', () async {
      when(() => mockLocalCacheService.read(key: any(named: 'key'))).thenAnswer((_) async => Future.value());

      when(() => mockLocalCacheService.delete(key: any(named: 'key'))).thenAnswer((_) async => Future.value());

      await userCredentialsManager.loadUserCredentials();

      expect(userCredentialsManager.userCredentials, isNull);
      verify(() => mockLocalCacheService.read(key: any(named: 'key'))).called(1);
      verify(() => mockLocalCacheService.delete(key: any(named: 'key'))).called(1);
      verifyNoMoreInteractions(mockLocalCacheService);
    });

    test('saveUserCredentials should save user credentials to cache', () async {
      final newUserCredentials = UserCredentialsModel(
        jwt: 'some-jwt-token',
        userName: 'John Doe',
      );

      when(() => mockLocalCacheService.save(key: any(named: 'key'), value: any(named: 'value'))).thenAnswer(
        (_) async => Future.value(),
      );

      await userCredentialsManager.saveUserCredentials(newUserCredentials);

      expect(userCredentialsManager.userCredentials, isNotNull);
      expect(userCredentialsManager.userCredentials?.userName, newUserCredentials.userName);
      expect(userCredentialsManager.userCredentials?.jwt, newUserCredentials.jwt);
      verify(() => mockLocalCacheService.save(key: any(named: 'key'), value: any(named: 'value'))).called(1);
      verifyNoMoreInteractions(mockLocalCacheService);
    });

    test('clearUserCredentials should clear user credentials from cache', () async {
      when(() => mockLocalCacheService.delete(key: any(named: 'key'))).thenAnswer((_) async => Future.value());

      await userCredentialsManager.clearUserCredentials();

      expect(userCredentialsManager.userCredentials, isNull);
      verify(() => mockLocalCacheService.delete(key: any(named: 'key'))).called(1);
      verifyNoMoreInteractions(mockLocalCacheService);
    });
  });
}
