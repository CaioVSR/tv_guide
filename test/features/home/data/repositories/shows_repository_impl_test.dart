import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/home/data/remote_data_source/shows_data_source.dart';
import 'package:tv_guide/features/home/data/repositories/shows_repository_impl.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';

class MockShowsDataSource extends Mock implements ShowsDataSource {}

void main() {
  late ShowsRepositoryImpl repository;
  late MockShowsDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockShowsDataSource();
    repository = ShowsRepositoryImpl(mockDataSource);
  });

  group('fetchShows', () {
    const name = 'Test Show';

    test('should return list of ShowSummaryEntity when the call is successful', () async {
      final response = Response(
        data: [
          {
            'score': 1.0,
            'show': {
              'id': 1,
              'name': 'Test Show',
              'image': {'medium': 'medium_url', 'original': 'original_url'},
            },
          }
        ],
        statusCode: 200,
        requestOptions: RequestOptions(path: '/search/shows?q=$name'),
      );

      when(() => mockDataSource.fetchShows(name: name)).thenAnswer((_) async => response);

      final result = await repository.fetchShows(name: name);

      expect(result, isA<List<ShowSummaryEntity>>());
      expect(result.length, 1);
      expect(result.first.title, 'Test Show');
      expect(result.first.imageUrl, 'medium_url');

      verify(() => mockDataSource.fetchShows(name: name)).called(1);

      verifyNoMoreInteractions(mockDataSource);
    });

    test('should throw an exception when the call is unsuccessful', () async {
      final response = Response(
        data: 'Error',
        statusCode: 404,
        requestOptions: RequestOptions(path: '/search/shows?q=$name'),
      );

      when(() => mockDataSource.fetchShows(name: name)).thenAnswer((_) async => response);

      expect(() => repository.fetchShows(name: name), throwsA(isA<Exception>()));

      verify(() => mockDataSource.fetchShows(name: name)).called(1);

      verifyNoMoreInteractions(mockDataSource);
    });
  });

  group('fetchShowById', () {
    const id = 1;

    test('should return ShowEntity when the call is successful', () async {
      final response = Response(
        data: {
          'id': 1,
          'name': 'Test Show',
          'status': 'Running',
          'rating': {'average': 9.0},
          'summary': 'Summary',
          'genres': ['Genre'],
          'image': {'original': 'original_url'},
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: '/shows/$id'),
      );

      when(() => mockDataSource.fetchShowById(id: id)).thenAnswer((_) async => response);

      final result = await repository.fetchShowById(id: id);

      expect(result, isA<ShowEntity>());
      expect(result.name, 'Test Show');
      expect(result.status, 'Running');
      expect(result.rating, 9.0);
      expect(result.summary, 'Summary');
      expect(result.genres, ['Genre']);
      expect(result.image, 'original_url');

      verify(() => mockDataSource.fetchShowById(id: id)).called(1);

      verifyNoMoreInteractions(mockDataSource);
    });

    test('should throw an exception when the call is unsuccessful', () async {
      final response = Response(
        data: 'Error',
        statusCode: 404,
        requestOptions: RequestOptions(path: '/shows/$id'),
      );

      when(() => mockDataSource.fetchShowById(id: id)).thenAnswer((_) async => response);

      expect(() => repository.fetchShowById(id: id), throwsA(isA<Exception>()));

      verify(() => mockDataSource.fetchShowById(id: id)).called(1);

      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
