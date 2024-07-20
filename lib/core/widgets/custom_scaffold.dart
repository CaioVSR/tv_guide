import 'package:flutter/material.dart';
import 'package:tv_guide/core/widgets/loading_widget.dart';

/// The [CustomScaffold] widget wraps a [Scaffold] and provides an overlay
/// portal that can display a loading animation when required. This widget
/// is useful for displaying a consistent loading animation across different
/// parts of the app.
///
class CustomScaffold extends StatelessWidget {
  /// Creates an instance of [CustomScaffold].
  ///
  /// The [overlayPortalController] is required to control the overlay.
  /// Optional parameters include [appBar], [body], [bodyPadding], and [bottomSheet].
  /// The overlay is controlled using an [OverlayPortalController] .
  ///
  /// Example usage:
  /// ```dart
  /// //Declare the overlayPortalController
  /// final overlayPortalController = OverlayPortalController();
  ///
  /// //When you want to show the overlay
  /// overlayPortalController.show();
  ///
  /// //When you want to hide the overlay
  /// overlayPortalController.hide();
  /// ```
  ///
  const CustomScaffold({
    required this.overlayPortalController,
    this.appBar,
    this.body,
    this.bodyPadding,
    this.bottomSheet,
    super.key,
  });

  /// The controller for managing the overlay portal loading.
  final OverlayPortalController overlayPortalController;

  /// An optional [AppBar] widget to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The main content of the scaffold.
  final Widget? body;

  /// The padding for the [body] content.
  final EdgeInsetsGeometry? bodyPadding;

  /// An optional widget to display at the bottom of the scaffold.
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: overlayPortalController,
      overlayChildBuilder: (context) => const LoadingWidget(),
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: bodyPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: body,
        ),
        bottomSheet: bottomSheet,
      ),
    );
  }
}
