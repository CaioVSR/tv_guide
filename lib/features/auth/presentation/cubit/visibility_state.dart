part of 'visibility_cubit.dart';

/// Abstract base class for visibility states.
///
/// The [VisibilityState] class serves as the base class for all states
/// related to the visibility of a password field. It is immutable and sealed
/// to ensure that all possible states are defined within this file.
@immutable
sealed class VisibilityState {
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
}

/// State representing the visibility state of the password field.
///
/// The [VisibilityInitial] state is used to indicate whether the password
/// field is obscured or visible.
///
/// Parameters:
/// - [obscurePassword]: A boolean indicating whether the password is obscured.
final class VisibilityInitial extends VisibilityState {
  /// Creates an instance of [VisibilityInitial].
  ///
  /// The [obscurePassword] parameter is required to specify the initial
  /// visibility state of the password field.
  const VisibilityInitial({required super.obscurePassword});
}
