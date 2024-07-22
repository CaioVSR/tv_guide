import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_show_use_case.dart';

class MockShowsRepository extends Mock implements ShowsRepository {}

void main() {
  late FetchShowUseCase useCase;
  late MockShowsRepository mockRepository;

  setUp(() {
    mockRepository = MockShowsRepository();
    useCase = FetchShowUseCase(mockRepository);
  });

  const testId = 1;
  const testShow = ShowEntity(
    name: 'Test Show',
    genres: ['Drama'],
    status: 'Running',
    rating: 8.5,
    image: 'test_image_url',
    summary: 'Test summary',
  );

  test('should return ShowEntity when the call to repository is successful', () async {
    when(() => mockRepository.fetchShowById(id: testId))
        .thenAnswer((_) async => testShow);

    final result = await useCase.call(id: testId);

    expect(result, isA<ShowEntity>());
    expect(result.name, 'Test Show');
    expect(result.genres, ['Drama']);
    expect(result.status, 'Running');
    expect(result.rating, 8.5);
    expect(result.image, 'test_image_url');
    expect(result.summary, 'Test summary');

    verify(() => mockRepository.fetchShowById(id: testId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should throw an exception when the call to repository fails', () async {
    when(() => mockRepository.fetchShowById(id: testId))
        .thenThrow(Exception('Failed to fetch show'));

    expect(() => useCase.call(id: testId), throwsA(isA<Exception>()));

    verify(() => mockRepository.fetchShowById(id: testId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
