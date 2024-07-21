/// Model class representing the response of a TV show.
///
/// The [ShowResponseModel] class encapsulates the details of a TV show,
/// including its ID, name, genres, status, runtime, rating, image, and summary.
class ShowResponseModel {
  /// Creates an instance of [ShowResponseModel].
  /// 
  /// The [id], [name], [genres], [status], [rating], [image], and [summary] parameters are optional.
  ShowResponseModel({
    required this.id,
    this.name,
    this.genres,
    this.status,
    this.rating,
    this.image,
    this.summary,
  });

  /// Factory constructor to create an instance of [ShowResponseModel] from JSON.
  factory ShowResponseModel.fromJson(Map<String, dynamic> json) {
    return ShowResponseModel(
      id: json['id'] as int,
      name: json['name'] as String?,
      genres: (json['genres'] as List?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      rating: json['rating'] != null ? RatingResponseModel.fromJson(json['rating'] as Map<String, dynamic>) : null,
      image: json['image'] != null ? ImageResponseModel.fromJson(json['image'] as Map<String, dynamic>) : null,
      summary: json['summary'] as String?,
    );
  }

  /// The unique identifier of the TV show.
  final int id;

  /// The name of the TV show.
  final String? name;

  /// The genres of the TV show.
  final List<String>? genres;

  /// The status of the TV show.
  final String? status;

  /// The rating of the TV show.
  final RatingResponseModel? rating;

  /// The runtime of the TV show.
  final ImageResponseModel? image;

  /// The summary of the TV show.
  final String? summary;
}

/// Model class representing the rating of a TV show.
///
/// The [RatingResponseModel] class contains the average rating of a TV show.
class RatingResponseModel {
  /// Creates an instance of [RatingResponseModel].
  /// 
  /// The [average] parameter is optional.
  RatingResponseModel({
    this.average,
  });

  /// Factory constructor to create an instance of [RatingResponseModel] from JSON.
  factory RatingResponseModel.fromJson(Map<String, dynamic> json) {
    return RatingResponseModel(
      average: (json['average'] as num?)?.toDouble(),
    );
  }

  /// The average rating of the TV show.
  final double? average;
}

/// Model class representing the images of a TV show.
///
/// The [ImageResponseModel] class contains the URLs for the medium and original sizes of a TV show's image.
class ImageResponseModel {
  /// Creates an instance of [ImageResponseModel].
  /// 
  /// The [medium] and [original] parameters are optional.
  ImageResponseModel({
    this.medium,
    this.original,
  });

  /// Factory constructor to create an instance of [ImageResponseModel] from JSON.
  factory ImageResponseModel.fromJson(Map<String, dynamic> json) {
    return ImageResponseModel(
      medium: json['medium'] as String?,
      original: json['original'] as String?,
    );
  }

  /// The URL of the medium-sized image.
  final String? medium;

  /// The URL of the original-sized image.
  final String? original;
}
