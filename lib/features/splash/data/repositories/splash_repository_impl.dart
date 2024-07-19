import 'package:tv_guide/core/entities/user_credential_entity.dart';
import 'package:tv_guide/features/splash/data/local_data_source/cache_data_source.dart';
import 'package:tv_guide/features/splash/domain/repositories/splash_repository.dart';

/// Implementation of the [SplashRepository] interface.
///
/// This class is responsible for fetching user credential data from the local cache
/// using the provided [CacheDataSource].
class SplashRepositoryImpl implements SplashRepository {
  /// Creates an instance of [SplashRepositoryImpl] with the provided [CacheDataSource].
  const SplashRepositoryImpl(this._cacheDataSource);

  /// An instance of [CacheDataSource] used to fetch data from the local cache.
  final CacheDataSource _cacheDataSource;

  /// Fetches the user credential data from the local cache.
  ///
  /// This method fetches the user credentials using the [CacheDataSource]
  /// and converts it to a [UserCredentialEntity].
  ///
  /// Returns a [Future<UserCredentialEntity?>] containing the user credentials,
  /// or `null` if no credentials are found.
  @override
  Future<UserCredentialEntity?> fetchLocalData() async {
    final userCredentialModel = await _cacheDataSource.fetchData();

    if (userCredentialModel != null) {
      return UserCredentialEntity(
        userName: userCredentialModel.userName,
        jwt: userCredentialModel.jwt,
      );
    }

    return null;
  }
}
