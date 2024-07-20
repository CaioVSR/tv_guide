import 'package:flutter/material.dart';

/// The [BottomSheetPrimaryButton] widget is designed to be used within a
/// bottom sheet, providing a consistent padding and style for the button.
/// It ensures that the button is properly spaced from the bottom of the
/// screen, accounting for any view insets such as the keyboard.
/// 
class BottomSheetPrimaryButton extends StatelessWidget {
  /// Creates an instance of [BottomSheetPrimaryButton].
  ///
  /// The [label] parameter specifies the text to display on the button.
  /// The [onTap] parameter is the callback that is triggered when the button is pressed.
  /// 
  const BottomSheetPrimaryButton({
    required this.label,
    required this.onTap,
    super.key,
  });

  /// The text to display on the button.
  final String label;

  /// The callback that is triggered when the button is pressed.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom < 64 ? 32 : 8,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: onTap,
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
