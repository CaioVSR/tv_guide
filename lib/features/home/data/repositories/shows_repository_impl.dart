import 'package:tv_guide/features/home/data/models/search_response_model.dart';
import 'package:tv_guide/features/home/data/models/show_response_model.dart';
import 'package:tv_guide/features/home/data/remote_data_source/shows_data_source.dart';
import 'package:tv_guide/features/home/domain/entities/show_entity.dart';
import 'package:tv_guide/features/home/domain/entities/show_summary_entity.dart';
import 'package:tv_guide/features/home/domain/repositories/shows_repository.dart';

/// Implementation of [ShowsRepository].
///
/// The [ShowsRepositoryImpl] class provides the concrete implementation
/// for fetching TV shows from the remote data source.
class ShowsRepositoryImpl implements ShowsRepository {
  /// Creates an instance of [ShowsRepositoryImpl].
  ///
  /// The [ShowsDataSource] parameter is required and is used to fetch TV shows
  /// from the remote data source.
  const ShowsRepositoryImpl(this._dataSource);

  /// The remote data source used to fetch TV shows.
  final ShowsDataSource _dataSource;

  /// Fetches TV shows by name.
  ///
  /// This method performs a request to the remote data source with the specified
  /// [name] parameter to search for TV shows. If the request is successful,
  /// it maps the raw data to a list of [SearchResponseModel] objects and then converts
  /// them to a list of [ShowSummaryEntity] objects.
  ///
  /// Returns a [Future] that completes with a list of [ShowSummaryEntity] objects.
  ///
  /// Throws an [Exception] if the request fails.
  @override
  Future<List<ShowSummaryEntity>> fetchShows({required String name}) async {
    final response = await _dataSource.fetchShows(name: name);

    if (response.statusCode == 200) {
      final rawData = response.data as List;

      final showsList = rawData.map((e) {
        return SearchResponseModel.fromJson(e as Map<String, dynamic>);
      }).toList();

      return showsList
          .map(
            (e) => ShowSummaryEntity(
              id: e.show.id,
              title: e.show.name ?? '',
              imageUrl: e.show.image?.medium ?? e.show.image?.original ?? '',
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to fetch shows');
    }
  }

  @override
  Future<ShowEntity> fetchShowById({required int id}) async {
    final response = await _dataSource.fetchShowById(id: id);

    if (response.statusCode == 200) {
      final rawData = response.data as Map<String, dynamic>;

      final show = ShowResponseModel.fromJson(rawData);

      return ShowEntity(
        name: show.name ?? '',
        status: show.status ?? '',
        rating: show.rating?.average,
        summary: show.summary ?? '',
        genres: show.genres ?? [],
        image: show.image?.original ?? '',
      );
    } else {
      throw Exception('Failed to fetch show');
    }
  }
}
