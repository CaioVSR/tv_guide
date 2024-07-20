import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';
import 'package:tv_guide/features/home/domain/use_cases/fetch_shows_use_case.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';

part 'home_page_state.dart';

/// Cubit class for managing the state of the home page.
///
/// The [HomePageCubit] class extends [Cubit] and is responsible for managing
/// the state of the home page, including handling the logout operation and fetching shows.
class HomePageCubit extends Cubit<HomePageState> {
  /// Creates an instance of [HomePageCubit].
  ///
  /// The [LogOutUseCase] and [FetchShowsUseCase] parameters are required to perform
  /// the logout operation and fetch shows, respectively.
  HomePageCubit(this._logOutUseCase, this._fetchShowsUseCase) : super(HomePageState.initial());

  /// The use case for logging out the user.
  final LogOutUseCase _logOutUseCase;

  /// The use case for fetching shows.
  final FetchShowsUseCase _fetchShowsUseCase;

  /// Logs out the user.
  ///
  /// This method emits a state with [HomePageStatus.loadInProgress] before
  /// performing the logout operation. If the logout operation is successful,
  /// it emits a state with [HomePageStatus.loadSuccess]. If an error occurs,
  /// it emits a state with [HomePageStatus.loadFailure].
  ///
  /// Returns:
  /// A [Future<void>] that completes when the logout process is done.
  Future<void> logOut() async {
    try {
      emit(state.copyWith(logOutStatus: HomePageStatus.loadInProgress));
      await _logOutUseCase.call();
      emit(state.copyWith(logOutStatus: HomePageStatus.loadSuccess));
    } catch (e) {
      emit(state.copyWith(logOutStatus: HomePageStatus.loadFailure));
    }
  }

  /// Fetches TV shows by name.
  ///
  /// This method emits a state with [HomePageStatus.loadInProgress] before
  /// performing the fetch shows operation. If the fetch operation is successful,
  /// it emits a state with [HomePageStatus.loadSuccess] and updates the shows list.
  /// If an error occurs, it emits a state with [HomePageStatus.loadFailure].
  ///
  /// The [name] parameter is required to search for TV shows with the specified name.
  ///
  /// Returns:
  /// A [Future<void>] that completes when the fetch shows process is done.
  Future<void> fetchShow({required String name}) async {
    try {
      emit(state.copyWith(pageStatus: HomePageStatus.loadInProgress));
      final shows = await _fetchShowsUseCase.call(name: name);
      emit(state.copyWith(pageStatus: HomePageStatus.loadSuccess, showsList: shows));
    } catch (e) {
      log('Failed to fetch shows: $e');
      emit(state.copyWith(pageStatus: HomePageStatus.loadFailure));
    }
  }
}
