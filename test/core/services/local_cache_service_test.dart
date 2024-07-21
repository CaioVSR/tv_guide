import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/core/services/local_cache_service.dart';

class MockSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  group('Test the methods of the Local Cache Service', () {
    late MockSecureStorage mockStorage;
    late LocalCacheService localCacheService;

    setUp(() {
      mockStorage = MockSecureStorage();
      localCacheService = LocalCacheService(mockStorage);
    });

    tearDown(() {
      reset(mockStorage);
    });

    test('save should call write on storage', () async {
      const key = 'test-key';
      const value = 'test-value';

      when(() => mockStorage.write(key: key, value: value)).thenAnswer((_) async => Future.value());

      await localCacheService.save(key: key, value: value);

      verify(() => mockStorage.write(key: key, value: value)).called(1);

      verifyNoMoreInteractions(mockStorage);
    });

    test('read should call read on storage', () async {
      const key = 'test-key';
      const value = 'test-value';

      when(() => mockStorage.read(key: key)).thenAnswer((_) async => value);

      final result = await localCacheService.read(key: key);

      expect(result, value);

      verify(() => mockStorage.read(key: key)).called(1);

      verifyNoMoreInteractions(mockStorage);
    });

    test('delete should call delete on storage', () async {
      const key = 'test-key';

      when(() => mockStorage.delete(key: key)).thenAnswer((_) async => Future.value());

      await localCacheService.delete(key: key);

      verify(() => mockStorage.delete(key: key)).called(1);

      verifyNoMoreInteractions(mockStorage);
    });
  });
}
