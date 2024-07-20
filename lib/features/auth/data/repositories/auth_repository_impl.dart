import 'package:tv_guide/core/entities/user_credential_entity.dart';
import 'package:tv_guide/features/auth/data/local_data_source/auth_local_data_source.dart';
import 'package:tv_guide/features/auth/data/remote_data_source/auth_remote_data_source.dart';
import 'package:tv_guide/features/auth/domain/repositories/auth_repository.dart';

/// Implementation of [AuthRepository].
///
/// The [AuthRepositoryImpl] class provides the implementation for the
/// [AuthRepository] interface, handling the authentication of users
/// using both local and remote data sources.
class AuthRepositoryImpl implements AuthRepository {
  /// Creates an instance of [AuthRepositoryImpl].
  ///
  /// The [AuthRepositoryImpl] constructor requires instances of
  /// [AuthLocalDataSource] and [AuthRemoteDataSource] to manage the
  /// authentication process.
  AuthRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  /// The local data source for caching user credentials.
  final AuthLocalDataSource _localDataSource;

  /// The remote data source for authenticating users.
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<UserCredentialEntity?> authenticate({required String email, required String password}) async {
    final userCredential = await _remoteDataSource.authenticate(email, password);

    if (userCredential == null) {
      return null;
    }

    await _localDataSource.cacheUserCredentials(userCredential);

    return UserCredentialEntity(userName: userCredential.userName, jwt: userCredential.jwt);
  }
}
