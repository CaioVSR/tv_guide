import 'package:bloc/bloc.dart';
import 'package:tv_guide/features/home/domain/use_cases/log_out_use_case.dart';

part 'home_page_state.dart';

/// Cubit class for managing the state of the home page.
///
/// The [HomePageCubit] class extends [Cubit] and is responsible for managing
/// the state of the home page, including handling the logout operation.
class HomePageCubit extends Cubit<HomePageState> {
  /// Creates an instance of [HomePageCubit].
  ///
  /// The [LogOutUseCase] parameter is required to perform the logout operation.
  HomePageCubit(this._logOutUseCase) : super(HomePageState.initial());

  /// The use case for logging out the user.
  final LogOutUseCase _logOutUseCase;

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
}
