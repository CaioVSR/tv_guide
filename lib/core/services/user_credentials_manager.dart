import 'dart:convert';
import 'dart:developer';

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
  UserCredentialsModel? _userCredentials;

  /// Returns the user's credentials.
  UserCredentialsModel? get userCredentials => _userCredentials;

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
    try {
      final rawUserData = await _localCacheService.read(key: _userKey);

      if (rawUserData != null && rawUserData.isNotEmpty) {
        final decodedData = jsonDecode(rawUserData);

        _userCredentials = UserCredentialsModel.fromJson(decodedData as Map<String, dynamic>);
      } else {
        await _localCacheService.delete(key: _userKey);
      }
    } catch (e) {
      log('Error loading user credentials: $e');

      await _localCacheService.delete(key: _userKey);
    }
  }

  /// Saves the user's credentials to the local cache.
  ///
  /// This method encodes the [_userCredentials] instance into a JSON string and stores it in the local cache.
  ///
  /// Example usage:
  /// ```dart
  /// await userCredentialsManager.saveUserCredentials();
  /// ```
  Future<void> saveUserCredentials(UserCredentialsModel newCredentials) async {
    await _localCacheService.save(key: _userKey, value: jsonEncode(newCredentials.toJson()));

    _userCredentials = newCredentials;
  }

  /// Clears the user's credentials from memory and local cache.
  ///
  /// This method sets the [_userCredentials] to null and deletes the stored data from the local cache.
  ///
  /// Example usage:
  /// ```dart
  /// await userCredentialsManager.clearUserCredentials();
  /// ```
  Future<void> clearUserCredentials() async {
    _userCredentials = null;
    await _localCacheService.delete(key: _userKey);
  }
}
