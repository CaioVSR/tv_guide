/// Entity class representing a summary of a TV show.
///
/// The [ShowSummaryEntity] class provides a summary of a TV show, including
/// the title, image URL, and average score.
class ShowSummaryEntity {
  /// Creates an instance of [ShowSummaryEntity].
  ///
  /// The [title] and [imageUrl] parameters are required, while the [averageScore]
  /// parameter is optional.
  ShowSummaryEntity({
    required this.title,
    required this.imageUrl,
    this.averageScore,
  });

  /// The title of the TV show.
  final String title;

  /// The URL of the image representing the TV show.
  final String imageUrl;

  /// The average score of the TV show.
  ///
  /// This parameter is optional and can be null if the average score is not available.
  final double? averageScore;
}
