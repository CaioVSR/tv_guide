part of 'login_cubit.dart';

/// Abstract base class for login states.
///
/// The [LoginState] class serves as the base class for all states
/// related to the login process. It is immutable and sealed to ensure
/// that all possible states are defined within this file.
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Initial state of the login process.
///
/// The [LoginInitial] state is emitted when the login process is in its initial state,
/// typically when the user has not yet attempted to log in.
final class LoginInitial extends LoginState {}

/// State emitted when the authentication is in progress.
///
/// The [LoginAuthenticationInProgress] state is emitted while the authentication
/// process is ongoing, typically after the user has submitted their login credentials
/// and before the authentication result is received.
final class LoginAuthenticationInProgress extends LoginState {}

/// State emitted when the authentication is successful.
///
/// The [LoginAuthenticationSucess] state is emitted when the user has successfully
/// authenticated. This state indicates that the login process has completed successfully.
final class LoginAuthenticationSucess extends LoginState {}

/// State emitted when the authentication fails.
///
/// The [LoginAuthenticationFailure] state is emitted when the authentication process
/// fails. This state includes an optional message describing the reason for the failure.
///
/// Parameters:
/// - [message]: An optional message describing the authentication failure.
final class LoginAuthenticationFailure extends LoginState {
  /// Creates an instance of [LoginAuthenticationFailure].
  ///
  /// The [message] parameter is optional and can be used to provide additional
  /// information about the failure.
  LoginAuthenticationFailure([this.message]);

  /// An optional message describing the authentication failure.
  final String? message;

  @override
  List<Object?> get props => [
        message,
      ];
}
