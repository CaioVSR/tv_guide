/// Repository interface for user-related operations.
///
/// The [UserRepository] interface defines the contract for operations
/// related to the user, such as logging out. Implementations of this
/// interface will provide the actual logic for these operations.
abstract class UserRepository {
  /// Logs out the user.
  ///
  /// This method performs the necessary actions to log out the user,
  /// such as clearing user credentials from storage. It returns a [Future]
  /// that completes when the logout process is done.
  ///
  /// Returns:
  /// A [Future<void>] that completes when the logout process is done.
  Future<void> logOut();
}
