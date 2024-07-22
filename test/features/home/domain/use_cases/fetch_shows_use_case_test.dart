import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_shows_use_case.dart';

class MockShowsRepository extends Mock implements ShowsRepository {}

void main() {
  late FetchShowsUseCase useCase;
  late MockShowsRepository mockRepository;

  setUp(() {
    mockRepository = MockShowsRepository();
    useCase = FetchShowsUseCase(mockRepository);
  });

  const testName = 'Test Show';
  final testShows = [
    const ShowSummaryEntity(
      id: 1,
      title: 'Test Show 1',
      imageUrl: 'test_image_url_1',
    ),
    const ShowSummaryEntity(
      id: 2,
      title: 'Test Show 2',
      imageUrl: 'test_image_url_2',
    ),
  ];

  test('should return list of ShowSummaryEntity when the call to repository is successful', () async {
    when(() => mockRepository.fetchShows(name: testName))
        .thenAnswer((_) async => testShows);

    final result = await useCase.call(name: testName);

    expect(result, isA<List<ShowSummaryEntity>>());
    expect(result.length, 2);
    expect(result.first.title, 'Test Show 1');
    expect(result.first.imageUrl, 'test_image_url_1');

    verify(() => mockRepository.fetchShows(name: testName)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should throw an exception when the call to repository fails', () async {
    when(() => mockRepository.fetchShows(name: testName))
        .thenThrow(Exception('Failed to fetch shows'));

    expect(() => useCase.call(name: testName), throwsA(isA<Exception>()));

    verify(() => mockRepository.fetchShows(name: testName)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
