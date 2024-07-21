part of 'visibility_cubit.dart';

/// Abstract base class for visibility states.
///
/// The [VisibilityState] class serves as the base class for all states
/// related to the visibility of a password field. It is immutable and sealed
/// to ensure that all possible states are defined within this file.
class VisibilityState extends Equatable {
  /// Abstract base class for visibility states.
  ///
  /// The [VisibilityState] class serves as the base class for all states
  /// related to the visibility of a password field.
  ///
  /// Parameters:
  /// - [obscurePassword]: A boolean indicating whether the password is obscured.
  const VisibilityState({required this.obscurePassword});

  /// A boolean indicating whether the password is obscured.
  final bool obscurePassword;

  @override
  List<Object?> get props => [
        obscurePassword,
      ];
}
