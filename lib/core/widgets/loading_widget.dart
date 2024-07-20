import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tv_guide/core/theme/app_colors.dart';

/// A widget that displays a loading animation with a semi-transparent background.
///
/// The [LoadingWidget] is a stateless widget that shows a centered loading animation
/// with a semi-transparent background overlay. This widget is typically used to indicate
/// that a background process is ongoing and the user should wait.
class LoadingWidget extends StatelessWidget {
  /// Creates an instance of [LoadingWidget].
  ///
  /// The constructor takes an optional key parameter.
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.background.withOpacity(0.8),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: AppColors.primaryVariant,
          size: 64,
        ),
      ),
    );
  }
}
