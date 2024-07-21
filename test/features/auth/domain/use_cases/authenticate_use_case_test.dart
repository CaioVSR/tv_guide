import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/auth/domain/exceptions/authentication_exceptions.dart';
import 'package:tv_guide/features/auth/domain/repositories/auth_repository.dart';
import 'package:tv_guide/features/auth/domain/use_cases/authenticate_use_case.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late AuthenticateUseCase authenticateUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authenticateUseCase = AuthenticateUseCase(mockAuthRepository);
  });

  tearDown(() {
    reset(mockAuthRepository);
  });

  group('AuthenticateUseCase', () {
    test('should call authenticate on the repository', () async {
      const email = 'admin@example.com';
      const password = 'admin';

      when(() => mockAuthRepository.authenticate(email: email, password: password))
          .thenAnswer((_) async => Future.value());

      await authenticateUseCase.call(email: email, password: password);

      verify(() => mockAuthRepository.authenticate(email: email, password: password)).called(1);

      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should throw InvalidCredentialsException on invalid credentials', () async {
      const email = 'admin@example.com';
      const password = 'wrongpassword';

      when(() => mockAuthRepository.authenticate(email: email, password: password))
          .thenThrow(Exception('Invalid credentials'));

      expect(
        () async => authenticateUseCase.call(email: email, password: password),
        throwsA(isA<InvalidCredentialsException>()),
      );

      verify(() => mockAuthRepository.authenticate(email: email, password: password)).called(1);

      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should throw GenericAuthenticationException on generic error', () async {
      const email = 'admin@example.com';
      const password = 'admin';

      when(() => mockAuthRepository.authenticate(email: email, password: password)).thenThrow(Exception('Some error'));

      expect(
        () async => authenticateUseCase.call(email: email, password: password),
        throwsA(isA<GenericAuthenticationException>()),
      );

      verify(() => mockAuthRepository.authenticate(email: email, password: password)).called(1);

      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
