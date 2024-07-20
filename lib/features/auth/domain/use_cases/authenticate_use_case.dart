import 'package:tv_guide/features/auth/domain/exceptions/authentication_exceptions.dart';
import 'package:tv_guide/features/auth/domain/repositories/auth_repository.dart';

/// Use case for authenticating a user.
///
/// The [AuthenticateUseCase] class handles the authentication of a user
/// by interacting with the [AuthRepository]. It catches and throws specific
/// authentication exceptions based on the error encountered.
class AuthenticateUseCase {
  /// Creates an instance of [AuthenticateUseCase].
  ///
  /// The [_authRepository] parameter is required to perform the authentication.
  AuthenticateUseCase(this._authRepository);

  /// The repository that handles authentication.
  final AuthRepository _authRepository;

  /// Authenticates the user using email and password.
  ///
  /// This method attempts to authenticate the user by calling the [AuthRepository].
  /// If authentication fails due to invalid credentials, it throws an [InvalidCredentialsException].
  /// For other errors, it throws a [GenericAuthenticationException].
  ///
  /// Parameters:
  /// - [email]: The user's email address.
  /// - [password]: The user's password.
  ///
  /// Returns:
  /// A [Future] that completes when the authentication process is done.
  ///
  /// Throws:
  /// - [InvalidCredentialsException]: If the credentials are invalid.
  /// - [GenericAuthenticationException]: If an unspecified error occurs during authentication.
  Future<void> call({required String email, required String password}) async {
    try {
      await _authRepository.authenticate(email: email, password: password);
    } catch (e) {
      if (e.toString().contains('Invalid credentials')) {
        throw InvalidCredentialsException();
      } else {
        throw GenericAuthenticationException();
      }
    }
  }
}
