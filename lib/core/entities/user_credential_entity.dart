/// The [UserCredentialEntity] class is the entity class for the user credentials.
///
/// This class is used to encapsulate the user's credentials data,
/// including the username and JWT token.
///
class UserCredentialEntity {
  /// Creates a new [UserCredentialEntity] with the given [userName] and [jwt].
  UserCredentialEntity({
    required this.userName,
    required this.jwt,
  });

  /// The name of the user.
  final String userName;

  /// The JWT token of the user.
  final String jwt;
}
