// ignore_for_file: avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_show_use_case.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_shows_use_case.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';
import 'package:tv_guide/features/home/presentation/cubit/home_page_cubit.dart';

class MockLogOutUseCase extends Mock implements LogOutUseCase {}

class MockFetchShowsUseCase extends Mock implements FetchShowsUseCase {}

class MockFetchShowUseCase extends Mock implements FetchShowUseCase {}

void main() {
  late HomePageCubit homePageCubit;
  late MockLogOutUseCase mockLogOutUseCase;
  late MockFetchShowsUseCase mockFetchShowsUseCase;
  late MockFetchShowUseCase mockFetchShowUseCase;

  setUp(() {
    mockLogOutUseCase = MockLogOutUseCase();
    mockFetchShowsUseCase = MockFetchShowsUseCase();
    mockFetchShowUseCase = MockFetchShowUseCase();
    homePageCubit = HomePageCubit(mockLogOutUseCase, mockFetchShowsUseCase, mockFetchShowUseCase);
  });

  tearDown(() {
    homePageCubit.close();
  });

  group('Tests the HomePageStatus enum getters', () {
    test('isInital', () {
      const status = HomePageStatus.initial;

      expect(status.isInitial, true);
      expect(status.isLoadInProgress, false);
      expect(status.isLoadSuccess, false);
      expect(status.isLoadFailure, false);
    });

    test('isLoadInProgress', () {
      const status = HomePageStatus.loadInProgress;

      expect(status.isInitial, false);
      expect(status.isLoadInProgress, true);
      expect(status.isLoadSuccess, false);
      expect(status.isLoadFailure, false);
    });

    test('isLoadSuccess', () {
      const status = HomePageStatus.loadSuccess;

      expect(status.isInitial, false);
      expect(status.isLoadInProgress, false);
      expect(status.isLoadSuccess, true);
      expect(status.isLoadFailure, false);
    });

    test('isLoadFailure', () {
      const status = HomePageStatus.loadFailure;

      expect(status.isInitial, false);
      expect(status.isLoadInProgress, false);
      expect(status.isLoadSuccess, false);
      expect(status.isLoadFailure, true);
    });
  });

  group('logOut', () {
    blocTest<HomePageCubit, HomePageState>(
      'emits [loadInProgress, loadSuccess] when logOut is successful',
      build: () {
        when(() => mockLogOutUseCase.call()).thenAnswer((_) async => Future.value());
        return homePageCubit;
      },
      act: (cubit) => cubit.logOut(),
      expect: () => [
        homePageCubit.state.copyWith(logOutStatus: HomePageStatus.loadInProgress),
        homePageCubit.state.copyWith(logOutStatus: HomePageStatus.loadSuccess),
      ],
      verify: (_) {
        verify(() => mockLogOutUseCase.call()).called(1);
      },
    );

    blocTest<HomePageCubit, HomePageState>(
      'emits [loadInProgress, loadFailure] when logOut fails',
      build: () {
        when(() => mockLogOutUseCase.call()).thenThrow(Exception('Failed to log out'));
        return homePageCubit;
      },
      act: (cubit) => cubit.logOut(),
      expect: () => [
        homePageCubit.state.copyWith(logOutStatus: HomePageStatus.loadInProgress),
        homePageCubit.state.copyWith(logOutStatus: HomePageStatus.loadFailure),
      ],
      verify: (_) {
        verify(() => mockLogOutUseCase.call()).called(1);
      },
    );
  });

  group('fetchShows', () {
    const testName = 'Test Show';
    final testShows = [
      ShowSummaryEntity(
        id: 1,
        title: 'Test Show 1',
        imageUrl: 'test_image_url_1',
      ),
      ShowSummaryEntity(
        id: 2,
        title: 'Test Show 2',
        imageUrl: 'test_image_url_2',
      ),
    ];

    blocTest<HomePageCubit, HomePageState>(
      'emits [loadInProgress, loadSuccess] with shows list when fetchShows is successful',
      build: () {
        when(() => mockFetchShowsUseCase.call(name: testName)).thenAnswer((_) async => testShows);
        return homePageCubit;
      },
      act: (cubit) => cubit.fetchShows(name: testName),
      expect: () => [
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadInProgress, showsList: []),
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadSuccess, showsList: testShows),
      ],
      verify: (_) {
        verify(() => mockFetchShowsUseCase.call(name: testName)).called(1);
      },
    );

    blocTest<HomePageCubit, HomePageState>(
      'emits [loadInProgress, loadFailure] when fetchShows fails',
      build: () {
        when(() => mockFetchShowsUseCase.call(name: testName)).thenThrow(Exception('Failed to fetch shows'));
        return homePageCubit;
      },
      act: (cubit) => cubit.fetchShows(name: testName),
      expect: () => [
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadInProgress, selectedShow: null),
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadFailure),
      ],
      verify: (_) {
        verify(() => mockFetchShowsUseCase.call(name: testName)).called(1);
      },
    );
  });

  group('fetchShowById', () {
    const testId = 1;
    final testShow = ShowEntity(
      name: 'Test Show',
      genres: const ['Drama'],
      status: 'Running',
      rating: 8.5,
      image: 'test_image_url',
      summary: 'Test summary',
    );

    blocTest<HomePageCubit, HomePageState>(
      'emits [loadInProgress, loadSuccess] with selected show when fetchShowById is successful',
      build: () {
        when(() => mockFetchShowUseCase.call(id: testId)).thenAnswer((_) async => testShow);
        return homePageCubit;
      },
      act: (cubit) => cubit.fetchShowById(testId),
      expect: () => [
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadInProgress),
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadSuccess, selectedShow: testShow),
      ],
      verify: (_) {
        verify(() => mockFetchShowUseCase.call(id: testId)).called(1);
      },
    );

    blocTest<HomePageCubit, HomePageState>(
      'emits [loadInProgress, loadFailure] when fetchShowById fails',
      build: () {
        when(() => mockFetchShowUseCase.call(id: testId)).thenThrow(Exception('Failed to fetch show'));
        return homePageCubit;
      },
      act: (cubit) => cubit.fetchShowById(testId),
      expect: () => [
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadInProgress),
        homePageCubit.state.copyWith(pageStatus: HomePageStatus.loadFailure),
      ],
      verify: (_) {
        verify(() => mockFetchShowUseCase.call(id: testId)).called(1);
      },
    );
  });
}
