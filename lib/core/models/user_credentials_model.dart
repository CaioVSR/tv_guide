/// The [UserCredentialsModel] class is the model class for the user credentials.
///
/// This class is used to store and manage the user's name, and JWT token.
/// It provides methods for converting to and from JSON format.
class UserCredentialsModel {
  /// Creates an instance of [UserCredentialsModel].
  /// 
  /// The [userName] parameter is a [String] containing the user's name.
  /// The [jwt] parameter is a [String] containing the JWT token.
  /// 
  UserCredentialsModel({
    required this.userName,
    required this.jwt,
  });

  /// Creates an instance of [UserCredentialsModel] from a JSON object.
  ///
  /// The [json] parameter is a [Map<String, dynamic>] containing the user's name, and JWT token.
  ///
  /// Example usage:
  /// ```dart
  /// final user = UserCredentialsModel.fromJson(json);
  /// ```
  factory UserCredentialsModel.fromJson(Map<String, dynamic> json) => UserCredentialsModel(
        userName: json['user_name'] as String,
        jwt: json['jwt'] as String,
      );

  /// The user's name.
  final String userName;

  /// The JWT token.
  final String jwt;

  /// Converts the [UserCredentialsModel] instance to a JSON object.
  ///
  /// Returns a [Map<String, dynamic>] containing the user's name, and JWT token.
  ///
  /// Example usage:
  /// ```dart
  /// final json = user.toJson();
  /// ```
  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'jwt': jwt,
      };
}
