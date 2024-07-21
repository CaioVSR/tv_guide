import 'package:tv_guide/features/home/data/models/show_response_model.dart';

/// Model class representing a show with its details and score.
///
/// The [SearchResponseModel] class encapsulates the information of a TV show,
/// including its relevance score and detailed information.
class SearchResponseModel {
  /// Creates an instance of [SearchResponseModel].
  ///
  /// The [score] and [show] parameters are required.
  SearchResponseModel({
    required this.score,
    required this.show,
  });

  /// Factory constructor to create an instance of [SearchResponseModel] from JSON.
  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return SearchResponseModel(
      score: (json['score'] as num).toDouble(),
      show: ShowResponseModel.fromJson(json['show'] as Map<String, dynamic>),
    );
  }

  /// The relevance score of the show.
  final double score;

  /// The detailed information of the show.
  final ShowResponseModel show;
}
