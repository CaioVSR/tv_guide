import 'package:tv_guide/core/entities/user_credential_entity.dart';

/// Repository interface for authentication.
///
/// The [AuthRepository] interface defines the contract for authenticating a user
/// using their email and password. Implementations of this interface will provide
/// the actual authentication logic.
abstract class AuthRepository {
  /// Authenticates the user using email and password.
  ///
  /// This method takes the user's email and password and returns a [Future]
  /// that completes with a [UserCredentialEntity] if the authentication is successful,
  /// or completes with `null` if the authentication fails.
  ///
  /// Parameters:
  /// - [email]: The user's email address.
  /// - [password]: The user's password.
  ///
  /// Returns:
  /// A [Future<UserCredentialEntity?>] that completes with the user's credentials
  /// if authentication is successful, or `null` if authentication fails.
  Future<UserCredentialEntity?> authenticate({required String email, required String password});
}
