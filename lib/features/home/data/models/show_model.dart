/// Model class for TV show response.
///
/// The [ShowModel] class represents the response from the TV show
/// search API, including the score and the details of the show.
class ShowModel {
  /// Creates an instance of [ShowModel].
  ///
  /// The [score] parameter represents the relevance score of the show,
  /// and the [show] parameter represents the detailed information of the show.
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

/// Model class for detailed show information.
///
/// The [Show] class contains detailed information about a TV show, such as
/// its ID, name, type, language, genres, status, runtime, premiere date,
/// official site, schedule, rating, weight, network, web channel, externals,
/// images, summary, updated date, and links.
class Show {
  /// Creates an instance of [Show].
  ///
  /// The parameters [id], [name], [type], [language], [genres], [status],
  /// [runtime], [premiered], [schedule], [rating], [weight], [externals],
  /// [image], [summary], [updated] are required.
  /// The [officialSite], [network], and [webChannel] parameters are optional.
  Show({
    required this.id,
    required this.name,
    required this.type,
    required this.genres,
    required this.status,
    required this.rating,
    required this.weight,
    required this.summary,
    required this.updated,
    this.image,
    this.premiered,
    this.officialSite,
    this.network,
    this.runtime,
    this.webChannel,
  });

  /// Factory constructor to create an instance of [Show] from JSON.
  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      genres: (json['genres'] as List<dynamic>).map((genre) => genre as String).toList(),
      status: json['status'] as String,
      runtime: json['runtime'] as int?,
      premiered: json['premiered'] as String?,
      officialSite: json['officialSite'] as String?,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
      weight: json['weight'] as int,
      network: json['network'] != null ? Network.fromJson(json['network'] as Map<String, dynamic>) : null,
      webChannel: json['webChannel'],
      image: json['image'] != null ? Image.fromJson(json['image'] as Map<String, dynamic>) : null,
      summary: json['summary'] as String,
      updated: json['updated'] as int,
    );
  }

  /// The unique identifier of the show.
  final int id;

  /// The name of the show.
  final String name;

  /// The type of the show.
  final String type;

  /// The genres of the show.
  final List<String> genres;

  /// The status of the show.
  final String status;

  /// The runtime of the show in minutes.
  final int? runtime;

  /// The premiere date of the show.
  final String? premiered;

  /// The official website of the show.
  final String? officialSite;

  /// The rating of the show.
  final Rating rating;

  /// The weight of the show.
  final int weight;

  /// The network that airs the show.
  final Network? network;

  /// The web channel that streams the show.
  final dynamic webChannel;

  /// The images of the show.
  final Image? image;

  /// The summary of the show.
  final String summary;

  /// The date when the show information was last updated.
  final int updated;
}

/// Model class for show rating.
///
/// The [Rating] class represents the rating of a TV show.
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

/// Model class for network information.
///
/// The [Network] class represents the network that airs the TV show,
/// including the network ID, name, and country.
class Network {
  /// Creates an instance of [Network].
  ///
  /// The [id], [name], and [country] parameters are required.
  Network({
    required this.id,
    required this.name,
    required this.country,
  });

  /// Factory constructor to create an instance of [Network] from JSON.
  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'] as int,
      name: json['name'] as String,
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
    );
  }

  /// The unique identifier of the network.
  final int id;

  /// The name of the network.
  final String name;

  /// The country where the network is based.
  final Country country;
}

/// Model class for country information.
///
/// The [Country] class represents a country, including its name, code, and timezone.
class Country {
  /// Creates an instance of [Country].
  ///
  /// The [name], [code], and [timezone] parameters are required.
  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  /// Factory constructor to create an instance of [Country] from JSON.
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] as String,
      code: json['code'] as String,
      timezone: json['timezone'] as String,
    );
  }

  /// The name of the country.
  final String name;

  /// The country code.
  final String code;

  /// The timezone of the country.
  final String timezone;
}

/// Model class for show images.
///
/// The [Image] class represents the images of a TV show, including
/// medium and original sizes.
class Image {
  /// Creates an instance of [Image].
  ///
  /// The [mediumSizeUrl] and [originalSizeUrl] parameters are required.
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

  /// The medium size image URL.
  final String? mediumSizeUrl;

  /// The original size image URL.
  final String? originalSizeUrl;
}
