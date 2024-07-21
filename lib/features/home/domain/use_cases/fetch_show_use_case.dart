import 'package:tv_guide/features/home/domain/entities/show_entity.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';

/// Use case class for fetching a TV show by ID.
///
/// The [FetchShowUseCase] class is responsible for fetching a TV show
/// by its ID from the repository.
class FetchShowUseCase {
  /// Creates an instance of [FetchShowUseCase].
  ///
  /// The [ShowsRepository] parameter is required and is used to fetch the TV show
  /// from the repository.
  FetchShowUseCase(this._repository);

  /// The repository used to fetch the TV show.
  final ShowsRepository _repository;

  /// Fetches a TV show by its ID.
  ///
  /// This method performs a request to the repository with the specified
  /// [id] parameter to retrieve the TV show. It returns a [ShowEntity]
  /// representing the fetched TV show.
  ///
  /// Returns a [Future] that completes with a [ShowEntity].
  Future<ShowEntity> call({required int id}) async {
    final fetchShow = await _repository.fetchShowById(id: id);

    return fetchShow;
  }
}
