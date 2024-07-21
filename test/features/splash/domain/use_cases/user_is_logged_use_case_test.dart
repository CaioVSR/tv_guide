import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/entities/user_credential_entity.dart';
import 'package:tv_guide/features/splash/domain/repositories/splash_repository.dart';
import 'package:tv_guide/features/splash/domain/use_cases/user_is_logged_use_case.dart';

class MockSplashRepository extends Mock implements SplashRepository {}

void main() {
  late MockSplashRepository mockSplashRepository;
  late UserIsLoggedUseCase userIsLoggedUseCase;

  setUp(() {
    mockSplashRepository = MockSplashRepository();
    userIsLoggedUseCase = UserIsLoggedUseCase(mockSplashRepository);
  });

  tearDown(() {
    reset(mockSplashRepository);
  });

  group('UserIsLoggedUseCase', () {
    test('should return true if user is logged in', () async {
      final userCredentialEntity = UserCredentialEntity(
        userName: 'Test User',
        jwt: 'some-jwt-token',
      );

      when(() => mockSplashRepository.fetchLocalData())
          .thenAnswer((_) async => userCredentialEntity);

      final result = await userIsLoggedUseCase.call();

      expect(result, isTrue);
      verify(() => mockSplashRepository.fetchLocalData()).called(1);
      verifyNoMoreInteractions(mockSplashRepository);
    });

    test('should return false if user is not logged in', () async {
      when(() => mockSplashRepository.fetchLocalData()).thenAnswer((_) async => null);

      final result = await userIsLoggedUseCase.call();

      expect(result, isFalse);
      verify(() => mockSplashRepository.fetchLocalData()).called(1);
      verifyNoMoreInteractions(mockSplashRepository);
    });
  });
}
