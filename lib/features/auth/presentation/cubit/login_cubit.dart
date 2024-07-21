import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_guide/features/auth/domain/exceptions/authentication_exceptions.dart';
import 'package:tv_guide/features/auth/domain/use_cases/authenticate_use_case.dart';

part 'login_state.dart';

/// Cubit for managing login state.
///
/// The [LoginCubit] class handles the authentication process and manages
/// the state of the login flow. It interacts with the [AuthenticateUseCase]
/// to perform the authentication and emits appropriate states based on
/// the authentication result.
class LoginCubit extends Cubit<LoginState> {
  /// Creates an instance of [LoginCubit].
  ///
  /// The [_authenticateUseCase] parameter is required to perform the authentication.
  LoginCubit(this._authenticateUseCase) : super(LoginInitial());

  /// The use case that handles user authentication.
  final AuthenticateUseCase _authenticateUseCase;

  /// Authenticates the user using email and password.
  ///
  /// This method attempts to authenticate the user by calling the [AuthenticateUseCase].
  /// It emits [LoginAuthenticationInProgress] while the authentication is in progress,
  /// [LoginAuthenticationSucess] if authentication succeeds, and [LoginAuthenticationFailure]
  /// if authentication fails with an appropriate error message.
  ///
  /// Parameters:
  /// - [email]: The user's email address.
  /// - [password]: The user's password.
  ///
  /// Returns:
  /// A [Future] that completes when the authentication process is done.
  Future<void> authenticate({required String email, required String password}) async {
    try {
      emit(LoginAuthenticationInProgress());
      await _authenticateUseCase.call(email: email, password: password);
      emit(LoginAuthenticationSucess());
    } on InvalidCredentialsException catch (e) {
      log('Invalid credentials: $e');
      emit(LoginAuthenticationFailure('Invalid credentials, please check your email and password and try again.'));
    } catch (e) {
      log('Error authenticating user: $e');
      emit(LoginAuthenticationFailure('Oh no! An error occurred while authenticating you. Please try again.'));
    }
  }
}
