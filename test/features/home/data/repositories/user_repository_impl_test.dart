import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';
import 'package:tv_guide/features/home/data/repositories/user_repository_impl.dart';

class MockUserCredentialsManager extends Mock implements UserCredentialsManager {}

void main() {
  late UserRepositoryImpl repository;
  late MockUserCredentialsManager mockUserCredentialsManager;

  setUp(() {
    mockUserCredentialsManager = MockUserCredentialsManager();
    repository = UserRepositoryImpl(mockUserCredentialsManager);
  });

  group('logOut', () {
    test('should call clearUserCredentials on UserCredentialsManager', () async {
      when(() => mockUserCredentialsManager.clearUserCredentials()).thenAnswer((_) async => Future.value());

      await repository.logOut();

      verify(() => mockUserCredentialsManager.clearUserCredentials()).called(1);
      verifyNoMoreInteractions(mockUserCredentialsManager);
    });

    test('should throw an exception when clearUserCredentials fails', () async {
      when(() => mockUserCredentialsManager.clearUserCredentials()).thenThrow(Exception('Failed to clear credentials'));

      expect(() => repository.logOut(), throwsA(isA<Exception>()));

      verify(() => mockUserCredentialsManager.clearUserCredentials()).called(1);
      verifyNoMoreInteractions(mockUserCredentialsManager);
    });
  });
}
