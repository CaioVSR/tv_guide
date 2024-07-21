/// Entity class representing a TV show.
///
/// The [ShowEntity] class encapsulates the essential information of a TV show,
/// including its name, genres, status, rating, image, and summary.
class ShowEntity {

  /// Creates an instance of [ShowEntity].
  /// 
  /// The [name], [genres], [status], [rating], [image], and [summary] parameters are required.
  ShowEntity({
    required this.name,
    required this.genres,
    required this.status,
    required this.rating,
    required this.image,
    required this.summary,
  });

  /// The name of the show.
  final String name;

  /// The genres of the show.
  final List<String> genres;

  /// The status of the show (e.g., "Running", "Ended").
  final String status;

  /// The average rating of the show.
  final double? rating;

  /// The URL of the show's image.
  final String? image;

  /// A brief summary of the show.
  final String summary;
}
