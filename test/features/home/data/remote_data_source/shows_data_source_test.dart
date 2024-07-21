import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/home/data/remote_data_source/shows_data_source.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('ShowsDataSourceImpl', () {
    late ShowsDataSourceImpl dataSource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      dataSource = ShowsDataSourceImpl(mockDio);
    });

    test('fetchShows should return a valid response', () async {
      const name = 'Test Show';
      final response = Response(
        data: 'response data',
        requestOptions: RequestOptions(path: '/search/shows?q=$name'),
      );

      when(() => mockDio.get<dynamic>('/search/shows?q=$name')).thenAnswer((_) async => response);

      final result = await dataSource.fetchShows(name: name);

      expect(result.data, 'response data');
      verify(() => mockDio.get<dynamic>('/search/shows?q=$name')).called(1);

      verifyNoMoreInteractions(mockDio);
    });

    test('fetchShowById should return a valid response', () async {
      const id = 1;
      final response = Response(
        data: 'response data',
        requestOptions: RequestOptions(path: '/shows/$id'),
      );

      when(() => mockDio.get<dynamic>('/shows/$id')).thenAnswer((_) async => response);

      final result = await dataSource.fetchShowById(id: id);

      expect(result.data, 'response data');
      verify(() => mockDio.get<dynamic>('/shows/$id')).called(1);

      verifyNoMoreInteractions(mockDio);
    });

    test('fetchShows should handle DioError', () async {
      const name = 'Test Show';

      when(() => mockDio.get<dynamic>('/search/shows?q=$name')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/search/shows?q=$name'),
        ),
      );

      expect(() => dataSource.fetchShows(name: name), throwsA(isA<DioException>()));

      verify(() => mockDio.get<dynamic>('/search/shows?q=$name')).called(1);

      verifyNoMoreInteractions(mockDio);
    });

    test('fetchShowById should handle DioError', () async {
      const id = 1;

      when(() => mockDio.get<dynamic>('/shows/$id')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/shows/$id'),
        ),
      );

      expect(() => dataSource.fetchShowById(id: id), throwsA(isA<DioException>()));

      verify(() => mockDio.get<dynamic>('/shows/$id')).called(1);

      verifyNoMoreInteractions(mockDio);
    });
  });
}
