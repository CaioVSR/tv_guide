import 'package:equatable/equatable.dart';

/// Entity class representing a summary of a TV show.
///
/// The [ShowSummaryEntity] class provides a summary of a TV show, including
/// the title, image URL.
///
class ShowSummaryEntity extends Equatable {
  /// Creates an instance of [ShowSummaryEntity].
  ///
  /// The [title] parameter is required and represents the title of the TV show.
  /// The [imageUrl] parameter is optional and represents the URL of the image
  ///
  const ShowSummaryEntity({
    required this.id,
    required this.title,
    this.imageUrl,
  });

  /// The title of the TV show.
  final String title;

  /// The URL of the image representing the TV show.
  final String? imageUrl;

  /// The ID of the TV show.
  final int id;

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
      ];
}
