import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/home/domain/repositories/user_repository.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late LogOutUseCase useCase;
  late MockUserRepository mockRepository;

  setUp(() {
    mockRepository = MockUserRepository();
    useCase = LogOutUseCase(mockRepository);
  });

  test('should call logOut on UserRepository', () async {
    when(() => mockRepository.logOut()).thenAnswer((_) async => Future.value());

    await useCase.call();

    verify(() => mockRepository.logOut()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should throw an exception when logOut fails', () async {
    when(() => mockRepository.logOut()).thenThrow(Exception('Failed to log out'));

    expect(() => useCase.call(), throwsA(isA<Exception>()));

    verify(() => mockRepository.logOut()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
