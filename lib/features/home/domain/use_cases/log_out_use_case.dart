import 'package:tv_guide/features/home/domain/repositories/user_repository.dart';

/// Use case for logging out a user.
///
/// The [LogOutUseCase] class handles the process of logging out a user by
/// interacting with the [UserRepository]. This class follows the clean architecture
/// principles by separating the business logic from the data layer.
class LogOutUseCase {
  /// Creates an instance of [LogOutUseCase].
  ///
  /// The [UserRepository] parameter is required to perform the logout operation.
  LogOutUseCase(this._userRepository);

  /// The repository that handles user-related operations.
  final UserRepository _userRepository;

  /// Logs out the user.
  ///
  /// This method calls the `logOut` method on the [UserRepository] to perform the
  /// logout operation. It returns a [Future] that completes when the logout process
  /// is done.
  ///
  /// Returns:
  /// A [Future<void>] that completes when the logout process is done.
  Future<void> call() async {
    return _userRepository.logOut();
  }
}
