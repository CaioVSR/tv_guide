import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tv_guide/features/splash/domain/use_cases/user_is_logged_use_case.dart';

part 'splash_page_state.dart';

/// Cubit that manages the state of the splash page.
class SplashPageCubit extends Cubit<SplashPageState> {
  /// Creates an instance of [SplashPageCubit] with the provided [UserIsLoggedUseCase].
  SplashPageCubit(this._userIsLoggedUseCase) : super(SplashInitial());

  final UserIsLoggedUseCase _userIsLoggedUseCase;

  /// Checks if the user is logged in and updates the state accordingly.
  Future<void> checkUserStatus() async {
    emit(SplashLoading());

    final isLogged = await _userIsLoggedUseCase();

    if (isLogged) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }
}
