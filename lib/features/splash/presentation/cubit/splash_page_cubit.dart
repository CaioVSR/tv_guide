import 'dart:developer';

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
  Future<void> init() async {
    try {
      final promises = <Future<dynamic>>[];

      emit(SplashLoading());

      promises.addAll([
        Future.delayed(const Duration(seconds: 2)),
        _userIsLoggedUseCase.call(),
      ]);

      await Future.wait(promises);

      final isUserLogged = promises[1] as bool;

      if (isUserLogged) {
        emit(SplashAuthenticated());
      } else {
        emit(SplashUnauthenticated());
      }
    } catch (e) {
      log('Error checking user status: $e');
      emit(SplashUnauthenticated());
    }
  }
}
