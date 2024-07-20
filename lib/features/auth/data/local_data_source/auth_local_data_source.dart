import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';

/// Interface for the local data source that handles caching of user credentials.
///
/// This interface defines the contract for caching user data locally.
/// Implementations of this interface will provide the actual caching logic.
abstract class AuthLocalDataSource {
  /// Caches the user data.
  ///
  /// This method takes a [UserCredentialsModel] object representing the user's credentials
  /// and caches it locally.
  ///
  /// Parameters:
  /// - [userCredentials]: The user credentials to be cached.
  ///
  /// Returns:
  /// A [Future] that completes when the user credentials have been cached.
  Future<void> cacheUserCredentials(UserCredentialsModel userCredentials);
}

/// Implementation of [AuthLocalDataSource] using [UserCredentialsManager].
///
/// This class provides the implementation of the [AuthLocalDataSource] interface
/// using the [UserCredentialsManager] to perform the actual caching operations.
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  /// Creates an instance of [AuthLocalDataSourceImpl].
  ///
  /// The [UserCredentialsManager] instance is required to manage the user credentials.
  AuthLocalDataSourceImpl(this._credentialsManager);

  /// The manager that handles saving and retrieving user credentials.
  final UserCredentialsManager _credentialsManager;

  @override
  Future<void> cacheUserCredentials(UserCredentialsModel userCredentials) async {
    await _credentialsManager.saveUserCredentials(userCredentials);
  }
}
