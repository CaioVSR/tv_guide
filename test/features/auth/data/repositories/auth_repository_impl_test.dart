import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/features/auth/data/local_data_source/auth_local_data_source.dart';
import 'package:tv_guide/features/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:tv_guide/features/auth/data/repositories/auth_repository_impl.dart';

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late AuthRepositoryImpl authRepository;

  setUp(() {
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepositoryImpl(mockAuthLocalDataSource, mockAuthRemoteDataSource);
  });

  tearDown(() {
    reset(mockAuthLocalDataSource);
    reset(mockAuthRemoteDataSource);
  });

  group('AuthRepositoryImpl', () {
    const email = 'admin@example.com';
    const password = 'admin';
    final userCredentials = UserCredentialsModel(
      userName: '',
      jwt: 'admin-$email',
    );
    test('should return UserCredentialEntity and cache credentials on successful authentication', () async {
      when(() => mockAuthRemoteDataSource.authenticate(email, password)).thenAnswer((_) async => userCredentials);
      when(() => mockAuthLocalDataSource.cacheUserCredentials(userCredentials)).thenAnswer((_) async => Future.value());

      final result = await authRepository.authenticate(email: email, password: password);

      expect(result, isNotNull);
      expect(result?.userName, userCredentials.userName);
      expect(result?.jwt, userCredentials.jwt);

      verify(() => mockAuthRemoteDataSource.authenticate(email, password)).called(1);
      verify(() => mockAuthLocalDataSource.cacheUserCredentials(userCredentials)).called(1);

      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test('should return null on failed authentication', () async {
      when(() => mockAuthRemoteDataSource.authenticate(email, password)).thenAnswer((_) async => null);

      final result = await authRepository.authenticate(email: email, password: password);

      expect(result, isNull);
      verify(() => mockAuthRemoteDataSource.authenticate(email, password)).called(1);
      verifyNever(() => mockAuthLocalDataSource.cacheUserCredentials(userCredentials));

      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });

    test('should throw exception on authentication error', () async {
      when(() => mockAuthRemoteDataSource.authenticate(email, password)).thenThrow(Exception('Network error'));

      expect(
        () async => authRepository.authenticate(email: email, password: password),
        throwsA(isA<Exception>().having((e) => e.toString(), 'description', contains('Network error'))),
      );

      verify(() => mockAuthRemoteDataSource.authenticate(email, password)).called(1);
      verifyNever(() => mockAuthLocalDataSource.cacheUserCredentials(userCredentials));

      verifyNoMoreInteractions(mockAuthRemoteDataSource);
    });
  });
}
