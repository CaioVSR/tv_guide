import 'package:tv_guide/core/entities/user_credential_entity.dart';

/// An abstract class that defines the contract for a repository responsible
/// for fetching user credential data.
///
/// Implementations of this class should provide the necessary logic to
/// fetch user credentials from a local data source or any other data source
/// as required.
abstract class SplashRepository {
  /// Fetches the user credential data.
  ///
  /// This method should be implemented to fetch the user credentials from
  /// the local cache or any other data source. The fetched credentials should
  /// be returned as a [UserCredentialEntity] object.
  ///
  /// Returns a [Future<UserCredentialEntity?>] containing the user credentials,
  /// or `null` if no credentials are found.
  Future<UserCredentialEntity?> fetchLocalData();
}
