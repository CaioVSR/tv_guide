import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visibility_state.dart';

/// Cubit for managing the visibility state of a password field.
///
/// The [VisibilityCubit] class handles the state of password visibility,
/// allowing the UI to toggle between showing and hiding the password.
class VisibilityCubit extends Cubit<VisibilityState> {
  /// Creates an instance of [VisibilityCubit].
  ///
  /// Initializes the state with [VisibilityState] where the password
  /// field is obscured by default.
  VisibilityCubit() : super(const VisibilityState(obscurePassword: true));

  /// Toggles the visibility of the password field.
  ///
  /// This method switches the `obscurePassword` state between true and false,
  /// effectively toggling the password visibility in the UI.
  void toggleVisibility() {
    emit(VisibilityState(obscurePassword: !state.obscurePassword));
  }
}
