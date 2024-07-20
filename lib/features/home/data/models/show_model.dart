/// Model class representing a show with its details and score.
///
/// The [ShowModel] class encapsulates the information of a TV show,
/// including its relevance score and detailed information.
class ShowModel {
  /// Creates an instance of [ShowModel].
  ///
  /// The [score] and [show] parameters are required.
  ShowModel({
    required this.score,
    required this.show,
  });

  /// Factory constructor to create an instance of [ShowModel] from JSON.
  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      score: (json['score'] as num).toDouble(),
      show: Show.fromJson(json['show'] as Map<String, dynamic>),
    );
  }

  /// The relevance score of the show.
  final double score;

  /// The detailed information of the show.
  final Show show;
}

/// Class representing detailed information of a show.
///
/// The [Show] class contains detailed information about a TV show,
/// such as its ID, name, type, genres, rating, summary, and image.
class Show {
  /// Creates an instance of [Show].
  ///
  /// The parameters [id], [name], [type], [genres], [rating], [summary], and [image] are optional.
  Show({
    this.id,
    this.name,
    this.type,
    this.genres,
    this.rating,
    this.summary,
    this.image,
  });

  /// Factory constructor to create an instance of [Show] from JSON.
  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      genres: (json['genres'] as List?)?.map((e) => e as String).toList(),
      rating: json['rating'] != null ? Rating.fromJson(json['rating'] as Map<String, dynamic>) : null,
      image: json['image'] != null ? Image.fromJson(json['image'] as Map<String, dynamic>) : null,
      summary: json['summary'] as String?,
    );
  }

  /// The unique identifier of the show.
  final int? id;

  /// The name of the show.
  final String? name;

  /// The type of the show.
  final String? type;

  /// The genres of the show.
  final List<String>? genres;

  /// The rating of the show.
  final Rating? rating;

  /// The image of the show.
  final Image? image;

  /// The summary of the show.
  final String? summary;
}

/// Class representing the rating of a show.
///
/// The [Rating] class contains the average rating of a TV show.
class Rating {
  /// Creates an instance of [Rating].
  ///
  /// The [average] parameter is optional.
  Rating({this.average});

  /// Factory constructor to create an instance of [Rating] from JSON.
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num?)?.toDouble(),
    );
  }

  /// The average rating of the show.
  final double? average;
}

/// Class representing the images of a show.
///
/// The [Image] class contains the URLs for the medium and original sizes of a show's image.
class Image {
  /// Creates an instance of [Image].
  ///
  /// The parameters [mediumSizeUrl] and [originalSizeUrl] are optional.
  Image({
    this.mediumSizeUrl,
    this.originalSizeUrl,
  });

  /// Factory constructor to create an instance of [Image] from JSON.
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      mediumSizeUrl: json['medium'] as String?,
      originalSizeUrl: json['original'] as String?,
    );
  }

  /// The URL for the medium size image of the show.
  final String? mediumSizeUrl;

  /// The URL for the original size image of the show.
  final String? originalSizeUrl;
}
