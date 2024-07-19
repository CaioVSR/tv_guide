import 'package:tv_guide/features/splash/domain/repositories/splash_repository.dart';

/// This class encapsulates the logic needed to fetch user credentials
/// from the provided [SplashRepository].
class UserIsLoggedUseCase {
  /// Creates an instance of [UserIsLoggedUseCase] with the provided [SplashRepository].
  const UserIsLoggedUseCase(this._splashRepository);

  /// An instance of [SplashRepository] used to fetch the user credentials.
  final SplashRepository _splashRepository;

  /// Fetches the user credentials.
  ///
  /// This method uses the repository to fetch the user credentials and returns
  /// a [Future<UserCredentialEntity?>] containing the user credentials,
  /// or `null` if no credentials are found.
  ///
  /// Returns a [Future<bool>] indicating whether the user credentials were fetched successfully.
  ///
  /// Example usage:
  /// ```dart
  /// final success = await fetchUserCredentialsUseCase();
  /// ```
  Future<bool> call() async {
    final userCredentialEntity = await _splashRepository.fetchLocalData();

    return userCredentialEntity != null;
  }
}
