/// A base class for authentication-related exceptions.
///
/// The [AuthenticationException] class serves as the base class for
/// exceptions that occur during the authentication process. It implements
/// the [Exception] interface and optionally includes a message describing
/// the exception.
sealed class AuthenticationException implements Exception {
  /// Creates an [AuthenticationException] with an optional message.
  ///
  /// The [message] parameter can be used to provide additional information
  /// about the exception.
  AuthenticationException([this.message]);

  /// An optional message describing the exception.
  final String? message;
}

/// An exception that indicates invalid credentials were provided.
///
/// The [InvalidCredentialsException] class extends [AuthenticationException]
/// and is used to signal that the provided user credentials are invalid.
class InvalidCredentialsException extends AuthenticationException {
  /// Creates an [InvalidCredentialsException] with an optional message.
  ///
  /// The [message] parameter can be used to provide additional information
  /// about the exception.
  InvalidCredentialsException([super.message]);
}

/// A generic exception for authentication errors.
///
/// The [GenericAuthenticationException] class extends [AuthenticationException]
/// and is used to signal a general authentication error that does not fall into
/// more specific categories.
class GenericAuthenticationException extends AuthenticationException {
  /// Creates a [GenericAuthenticationException] with an optional message.
  ///
  /// The [message] parameter can be used to provide additional information
  /// about the exception.
  GenericAuthenticationException([super.message]);
}
