/// Entity class representing a summary of a TV show.
///
/// The [ShowSummaryEntity] class provides a summary of a TV show, including
/// the title, image URL, and average score.
class ShowSummaryEntity {
  /// Creates an instance of [ShowSummaryEntity].
  ///
  /// The [title] parameter is required and represents the title of the TV show.
  /// The [imageUrl] parameter is optional and represents the URL of the image
  ShowSummaryEntity({
    required this.title,
    this.imageUrl,
  });

  /// The title of the TV show.
  final String title;

  /// The URL of the image representing the TV show.
  final String? imageUrl;
}
