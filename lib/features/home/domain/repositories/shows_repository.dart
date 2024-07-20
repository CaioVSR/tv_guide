import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';

/// Abstract repository class for fetching TV shows.
///
/// The [ShowsRepository] class defines the contract for fetching TV shows
/// from a data source.
abstract class ShowsRepository {
  /// Fetches TV shows by name.
  ///
  /// The [name] parameter is required and is used to search for TV shows
  /// with the specified name.
  ///
  /// Returns a [Future] that completes with a list of [ShowSummaryEntity] objects
  /// representing the fetched TV shows.
  Future<List<ShowSummaryEntity>> fetchShows({required String name});
}
