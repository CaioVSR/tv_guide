import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';

/// Use case class for fetching TV shows.
///
/// The [FetchShowsUseCase] class is responsible for fetching TV shows
/// by name from the repository.
class FetchShowsUseCase {
  /// Creates an instance of [FetchShowsUseCase].
  ///
  /// The [ShowsRepository] parameter is required and is used to fetch TV shows
  /// from the repository.
  const FetchShowsUseCase(this._repository);

  /// The repository used to fetch TV shows.
  final ShowsRepository _repository;

  /// Fetches TV shows by name.
  ///
  /// This method performs a request to the repository with the specified
  /// [name] parameter to search for TV shows. It returns a list of [ShowSummaryEntity]
  /// objects representing the fetched TV shows.
  ///
  /// Returns a [Future] that completes with a list of [ShowSummaryEntity] objects.
  Future<List<ShowSummaryEntity>> call({required String name}) async {
    final fetchShows = await _repository.fetchShows(name: name);

    return fetchShows;
  }
}
