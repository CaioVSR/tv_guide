import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/core/services/user_credentials_manager.dart';

/// An abstract class that defines a data source for fetching user credentials.
abstract class CacheDataSource {
  /// Fetches the user credentials.
  ///
  /// Returns a [Future<UserCredentialsModel?>] containing the user credentials, or `null` if no credentials are found.
  Future<UserCredentialsModel?> fetchData();
}

/// A concrete implementation of [CacheDataSource] that uses [UserCredentialsManager] to fetch user credentials from the local cache.
class CacheDataSourceImpl implements CacheDataSource {
  /// Creates an instance of [CacheDataSourceImpl] with the provided [UserCredentialsManager].
  const CacheDataSourceImpl(this._userCredentialsManager);

  /// An instance of [UserCredentialsManager] used to manage user credentials.
  final UserCredentialsManager _userCredentialsManager;

  /// Fetches the user credentials from the local cache.
  ///
  /// This method loads the user credentials using the [UserCredentialsManager] and returns the loaded credentials.
  ///
  /// Returns a [Future<UserCredentialsModel?>] containing the user credentials, or `null` if no credentials are found.
  @override
  Future<UserCredentialsModel?> fetchData() async {
    await _userCredentialsManager.loadUserCredentials();

    return _userCredentialsManager.userCredentials;
  }
}
