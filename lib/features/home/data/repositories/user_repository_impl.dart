import 'package:tv_guide/core/services/user_credentials_manager.dart';
import 'package:tv_guide/features/home/domain/repositories/user_repository.dart';

/// Implementation of [UserRepository].
///
/// The [UserRepositoryImpl] class provides the implementation for the
/// [UserRepository] interface, handling user-related operations such as logging out.
class UserRepositoryImpl implements UserRepository {
  /// Creates an instance of [UserRepositoryImpl].
  ///
  /// The [UserCredentialsManager] parameter is required to manage user credentials.
  const UserRepositoryImpl(this._userCredentialsManager);

  /// The manager that handles user credentials.
  final UserCredentialsManager _userCredentialsManager;

  /// Logs out the user.
  ///
  /// This method calls the `clearUserCredentials` method on the [UserCredentialsManager]
  /// to clear the stored user credentials and effectively log out the user.
  ///
  /// Returns:
  /// A [Future<void>] that completes when the logout process is done.
  @override
  Future<void> logOut() {
    return _userCredentialsManager.clearUserCredentials();
  }
}
