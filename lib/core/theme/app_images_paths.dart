/// A class that contains the paths to the images used in the project.
///
/// This class provides a centralized location for defining the paths to
/// all the image assets used in the app, ensuring consistency and ease of maintenance.
class AppImagePaths {
  /// Private constructor to prevent instantiation of this class.
  const AppImagePaths._();

  /// The path to the full logo image with background.
  static const String logoFull = 'assets/images/logo_full.png';

  /// The path to the logo image without background.
  static const String logoTransparentBg = 'assets/images/logo_no_bg.png';

  /// The path to the error image.
  static const String error = 'assets/images/error.png';
}
