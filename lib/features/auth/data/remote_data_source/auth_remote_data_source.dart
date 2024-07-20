import 'package:tv_guide/core/models/user_credentials_model.dart';

/// Interface for the remote data source that handles user authentication.
///
/// This interface defines the contract for authenticating a user using
/// their email and password with a remote data source.
abstract class AuthRemoteDataSource {
  /// Authenticates the user using email and password.
  ///
  /// This method takes the user's email and password and returns a [Future]
  /// that completes with a [UserCredentialsModel] if the authentication is successful,
  /// or completes with `null` if the authentication fails.
  ///
  /// Parameters:
  /// - [email]: The user's email address.
  /// - [password]: The user's password.
  ///
  /// Returns:
  /// A [Future<UserCredentialsModel?>] that completes with the user's credentials
  /// if authentication is successful, or `null` if authentication fails.
  Future<UserCredentialsModel?> authenticate(String email, String password);
}

/// Mock implementation of [AuthRemoteDataSource].
///
/// This class provides a mock implementation of the [AuthRemoteDataSource] interface,
/// simulating a remote authentication process.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredentialsModel?> authenticate(String email, String password) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        final userName = email.split('@').first;

        if (userName == 'admin' && password == 'admin') {
          return UserCredentialsModel(userName: userName, jwt: '$userName-$email');
        }

        throw Exception('Invalid credentials');
      },
    );
  }
}
