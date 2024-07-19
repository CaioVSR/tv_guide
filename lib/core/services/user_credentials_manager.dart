import 'dart:convert';

import 'package:tv_guide/core/models/user_credentials_model.dart';
import 'package:tv_guide/core/services/local_cache_service.dart';

/// The [UserCredentialsManager] class is responsible for managing the user's credentials.
///
/// It provides methods to load and save the user's credentials to and from the local cache.
///
class UserCredentialsManager {
  /// Creates an instance of [UserCredentialsManager] with the provided [LocalCacheService].
  UserCredentialsManager(this._localCacheService);

  /// Creates an instance of [UserCredentialsManager] with the provided [LocalCacheService].
  final LocalCacheService _localCacheService;

  /// The key used to store the user credentials in the local cache.
  static const _userKey = 'user_data';

  /// An instance of [UserCredentialsModel] representing the user's credentials.
  UserCredentialsModel? userCredentials;

  /// Loads the user's credentials from the local cache.
  ///
  /// This method reads the user credentials stored in the local cache and decodes them into
  /// a [UserCredentialsModel] instance. If the stored data is invalid, it deletes the corrupted data.
  ///
  /// Example usage:
  /// ```dart
  /// await userCredentialsManager.loadUserCredentials();
  /// ```
  Future<void> loadUserCredentials() async {
    final rawUserData = await _localCacheService.read(key: _userKey);

    if (rawUserData != null && rawUserData.isNotEmpty) {
      final decodedData = json.decode(rawUserData);

      if (decodedData.runtimeType == Map<String, dynamic>) {
        userCredentials = UserCredentialsModel.fromJson(decodedData as Map<String, dynamic>);
      } else {
        // If there is an error in decoding, delete the corrupted data
        await _localCacheService.delete(key: _userKey);
      }
    }
  }

  /// Saves the user's credentials to the local cache.
  ///
  /// This method encodes the [userCredentials] instance into a JSON string and stores it in the local cache.
  ///
  /// Example usage:
  /// ```dart
  /// await userCredentialsManager.saveUserCredentials();
  /// ```
  Future<void> saveUserCredentials() async {
    await _localCacheService.save(key: _userKey, value: json.encode(userCredentials?.toJson()));
  }

  /// Clears the user's credentials from memory and local cache.
  ///
  /// This method sets the [userCredentials] to null and deletes the stored data from the local cache.
  ///
  /// Example usage:
  /// ```dart
  /// await userCredentialsManager.clearUserCredentials();
  /// ```
  Future<void> clearUserCredentials() async {
    userCredentials = null;
    await _localCacheService.delete(key: _userKey);
  }
}
