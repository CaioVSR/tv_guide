import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/splash/domain/use_cases/user_is_logged_use_case.dart';
import 'package:tv_guide/features/splash/presentation/cubit/splash_page_cubit.dart';

class MockUserIsLoggedUseCase extends Mock implements UserIsLoggedUseCase {}

void main() {
  late MockUserIsLoggedUseCase mockUserIsLoggedUseCase;
  late SplashPageCubit splashPageCubit;

  setUp(() {
    mockUserIsLoggedUseCase = MockUserIsLoggedUseCase();
    splashPageCubit = SplashPageCubit(mockUserIsLoggedUseCase);
  });

  tearDown(() {
    splashPageCubit.close();
  });

  group('SplashPageCubit', () {
    test('initial state is SplashPageInitial', () {
      expect(splashPageCubit.state, isA<SplashInitial>());
    });

    blocTest<SplashPageCubit, SplashPageState>(
      'emits [SplashPageLoading, SplashPageAuthenticated] when user is logged in',
      build: () {
        when(() => mockUserIsLoggedUseCase.call())
            .thenAnswer((_) async => true);
        return splashPageCubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        isA<SplashLoading>(),
        isA<SplashAuthenticated>(),
      ],
    );

    blocTest<SplashPageCubit, SplashPageState>(
      'emits [SplashPageLoading, SplashPageUnauthenticated] when user is not logged in',
      build: () {
        when(() => mockUserIsLoggedUseCase.call())
            .thenAnswer((_) async => false);
        return splashPageCubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        isA<SplashLoading>(),
        isA<SplashUnauthenticated>(),
      ],
    );

    blocTest<SplashPageCubit, SplashPageState>(
      'emits [SplashPageLoading, SplashPageError] when an exception occurs',
      build: () {
        when(() => mockUserIsLoggedUseCase.call())
            .thenThrow(Exception('Some error'));
        return splashPageCubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        isA<SplashLoading>(),
        isA<SplashUnauthenticated>(),
      ],
    );
  });
}
