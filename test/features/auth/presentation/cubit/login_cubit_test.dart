import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/auth/domain/exceptions/authentication_exceptions.dart';
import 'package:tv_guide/features/auth/domain/use_cases/authenticate_use_case.dart';
import 'package:tv_guide/features/auth/presentation/cubit/login_cubit.dart';

class MockAuthenticateUseCase extends Mock implements AuthenticateUseCase {}

void main() {
  late MockAuthenticateUseCase mockAuthenticateUseCase;
  late LoginCubit loginCubit;

  setUp(() {
    mockAuthenticateUseCase = MockAuthenticateUseCase();
    loginCubit = LoginCubit(mockAuthenticateUseCase);
  });

  tearDown(() {
    loginCubit.close();
  });

  group('LoginCubit', () {
    test('initial state is LoginInitial', () {
      expect(loginCubit.state, isA<LoginInitial>());
    });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginAuthenticationInProgress, LoginAuthenticationSuccess] when authentication is successful',
      build: () {
        when(() => mockAuthenticateUseCase.call(email: any(named: 'email'), password: any(named: 'password')))
            .thenAnswer((_) async => Future.value());
        return loginCubit;
      },
      act: (cubit) => cubit.authenticate(email: 'admin@example.com', password: 'admin'),
      expect: () => [
        isA<LoginAuthenticationInProgress>(),
        isA<LoginAuthenticationSucess>(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginAuthenticationInProgress, LoginAuthenticationFailure] when authentication fails due to invalid credentials',
      build: () {
        when(() => mockAuthenticateUseCase.call(email: any(named: 'email'), password: any(named: 'password')))
            .thenThrow(InvalidCredentialsException());
        return loginCubit;
      },
      act: (cubit) => cubit.authenticate(email: 'admin@example.com', password: 'wrongpassword'),
      expect: () => [
        isA<LoginAuthenticationInProgress>(),
        LoginAuthenticationFailure('Invalid credentials, please check your email and password and try again.'),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginAuthenticationInProgress, LoginAuthenticationFailure] when authentication fails due to a generic error',
      build: () {
        when(() => mockAuthenticateUseCase.call(email: any(named: 'email'), password: any(named: 'password')))
            .thenThrow(Exception('Some error'));
        return loginCubit;
      },
      act: (cubit) => cubit.authenticate(email: 'admin@example.com', password: 'admin'),
      expect: () => [
        LoginAuthenticationInProgress(),
        LoginAuthenticationFailure('Oh no! An error occurred while authenticating you. Please try again.'),
      ],
    );
  });
}
