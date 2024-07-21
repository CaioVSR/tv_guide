import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';
import 'package:tv_guide/features/auth/data/local_data_source/auth_local_data_source.dart';

class MockUserCredentialsManager extends Mock implements UserCredentialsManager {}

void main() {
  late MockUserCredentialsManager mockUserCredentialsManager;
  late AuthLocalDataSourceImpl authLocalDataSource;

  setUp(() {
    mockUserCredentialsManager = MockUserCredentialsManager();
    authLocalDataSource = AuthLocalDataSourceImpl(mockUserCredentialsManager);
  });

  tearDown(() {
    reset(mockUserCredentialsManager);
  });

  group('AuthLocalDataSourceImpl', () {
    final newCredentials = UserCredentialsModel(
      userName: 'John Doe',
      jwt: 'some-jwt-token',
    );

    test('should call saveUserCredentials on UserCredentialsManager with correct credentials', () async {
      when(() => mockUserCredentialsManager.saveUserCredentials(newCredentials)).thenAnswer((_) async {});

      await authLocalDataSource.cacheUserCredentials(newCredentials);

      verify(() => mockUserCredentialsManager.saveUserCredentials(newCredentials)).called(1);

      verifyNoMoreInteractions(mockUserCredentialsManager);
    });

    test('should throw if saveUserCredentials on UserCredentialsManager fails', () async {
      when(() => mockUserCredentialsManager.saveUserCredentials(newCredentials))
          .thenThrow(Exception('Failed to save credentials'));

      expect(
        () => authLocalDataSource.cacheUserCredentials(newCredentials),
        throwsA(isA<Exception>()),
      );

      verify(() => mockUserCredentialsManager.saveUserCredentials(newCredentials)).called(1);

      verifyNoMoreInteractions(mockUserCredentialsManager);
    });
  });
}
