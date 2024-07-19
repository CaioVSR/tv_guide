import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A service class for handling local secure storage operations.
///
/// This service utilizes the [FlutterSecureStorage] package to securely store
/// and retrieve data such as user credentials and other sensitive information.
/// 
class LocalCacheService {
  /// Creates an instance of [LocalCacheService] with the provided [FlutterSecureStorage] instance.
  const LocalCacheService(this._storage);

  final FlutterSecureStorage _storage;

  /// Saves a key-value pair to the secure storage.
  ///
  /// The [key] is the identifier for the value to be stored.
  /// The [value] is the data to be stored securely.
  /// 
  /// Example usage:
  /// ```dart
  /// await localCacheService.save(key: 'username', value: 'admin');
  /// ```
  /// 
  /// Throws an [Exception] if the save operation fails.
  /// 
  Future<void> save({required String key, required String value}) => _storage.write(key: key, value: value);

  /// Reads a value from the secure storage for the given [key].
  /// 
  /// Returns the stored value as a [String] if it exists, or `null` if it does not exist.
  /// 
  /// Example usage:
  /// ```dart
  /// String? username = await localCacheService.read(key: 'username');
  /// ```
  /// 
  /// Throws an [Exception] if the read operation fails.
  /// 
  Future<String?> read({required String key}) => _storage.read(key: key);

  /// Deletes a value from the secure storage for the given [key].
  /// 
  /// Example usage:
  /// ```dart
  /// await localCacheService.delete(key: 'username');
  /// 
  /// Throws an [Exception] if the delete operation fails.
  /// 
  Future<void> delete({required String key}) => _storage.delete(key: key);
}
