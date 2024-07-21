import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';
import 'package:tv_guide/features/splash/data/local_data_source/cache_data_source.dart';

class MockUserCredentialsManager extends Mock implements UserCredentialsManager {}

void main() {
  late MockUserCredentialsManager mockUserCredentialsManager;
  late CacheDataSourceImpl cacheDataSource;

  setUp(() {
    mockUserCredentialsManager = MockUserCredentialsManager();
    cacheDataSource = CacheDataSourceImpl(mockUserCredentialsManager);
  });

  tearDown(() {
    reset(mockUserCredentialsManager);
  });

  group('CacheDataSourceImpl', () {
    test('fetchData should return valid user credential', () async {
      final validUserCredential = UserCredentialsModel(userName: 'John Doe', jwt: 'some-valid-jwt');

      when(() => mockUserCredentialsManager.loadUserCredentials()).thenAnswer((_) async => Future.value());
      when(() => mockUserCredentialsManager.userCredentials).thenReturn(validUserCredential);

      final result = await cacheDataSource.fetchData();

      expect(result, validUserCredential);

      verify(() => mockUserCredentialsManager.loadUserCredentials()).called(1);
    });

    test('fetchData should return null if no credentials are available', () async {
      when(() => mockUserCredentialsManager.loadUserCredentials()).thenAnswer((_) async => Future.value());
      when(() => mockUserCredentialsManager.userCredentials).thenReturn(null);

      final result = await cacheDataSource.fetchData();

      expect(result, isNull);
      verify(() => mockUserCredentialsManager.loadUserCredentials()).called(1);
    });
  });
}
