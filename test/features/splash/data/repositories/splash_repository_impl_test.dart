import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/features/splash/data/local_data_source/cache_data_source.dart';
import 'package:tv_guide/features/splash/data/repositories/splash_repository_impl.dart';

class MockCacheDataSource extends Mock implements CacheDataSource {}

void main() {
  late MockCacheDataSource mockCacheDataSource;
  late SplashRepositoryImpl splashRepository;

  setUp(() {
    mockCacheDataSource = MockCacheDataSource();
    splashRepository = SplashRepositoryImpl(mockCacheDataSource);
  });

  tearDown(() {
    reset(mockCacheDataSource);
  });

  group('SplashRepositoryImpl', () {
    test('fetchLocalData should return UserCredentialEntity if data is available', () async {
      final userCredentialsModel = UserCredentialsModel(
        userName: 'John Doe',
        jwt: 'some-jwt-token',
      );

      when(() => mockCacheDataSource.fetchData()).thenAnswer((_) async => userCredentialsModel);

      final result = await splashRepository.fetchLocalData();

      expect(result, isNotNull);
      expect(result?.userName, userCredentialsModel.userName);
      expect(result?.jwt, userCredentialsModel.jwt);

      verify(() => mockCacheDataSource.fetchData()).called(1);

      verifyNoMoreInteractions(mockCacheDataSource);
    });

    test('fetchLocalData should return null if no data is available', () async {
      when(() => mockCacheDataSource.fetchData()).thenAnswer((_) async => null);

      final result = await splashRepository.fetchLocalData();

      expect(result, isNull);
      verify(() => mockCacheDataSource.fetchData()).called(1);

      verifyNoMoreInteractions(mockCacheDataSource);
    });
  });
}
