import 'package:dio/dio.dart';

/// Abstract class representing the data source for fetching TV shows.
///
/// The [ShowsDataSource] class defines the contract for fetching TV shows
/// from a remote API.
///
abstract class ShowsDataSource {
  /// Fetches TV shows by name.
  ///
  /// The [name] parameter is required and is used to search for TV shows
  /// with the specified name.
  ///
  /// Returns a [Future] that completes with the [Response] containing the fetched data.
  ///
  Future<Response<dynamic>> fetchShows({required String name});

  /// Fetches TV shows by ID.
  ///
  /// The [id] parameter is required and is used to search for a TV show
  /// with the specified ID.
  ///
  /// Returns a [Future] that completes with the [Response] containing the fetched data.
  ///
  Future<Response<dynamic>> fetchShowById({required int id});
}

/// Implementation of [ShowsDataSource] using the Dio HTTP client.
///
/// The [ShowsDataSourceImpl] class provides the concrete implementation
/// for fetching TV shows from the TVMaze API using the Dio HTTP client.
class ShowsDataSourceImpl implements ShowsDataSource {
  /// Creates an instance of [ShowsDataSourceImpl].
  ///
  /// The [Dio] parameter is required and is used to perform HTTP requests.
  const ShowsDataSourceImpl(this._client);

  /// The Dio HTTP client used to perform HTTP requests.
  final Dio _client;

  /// Fetches TV shows by name.
  ///
  /// This method performs a GET request to the TVMaze API with the specified
  /// [name] parameter to search for TV shows. The response containing the
  /// fetched data is returned.
  ///
  /// Returns a [Future] that completes with the [Response] containing the fetched data.
  @override
  Future<Response<dynamic>> fetchShows({required String name}) async =>
      _client.get<dynamic>('/search/shows?q=$name');

  /// Fetches TV shows by ID.
  ///
  /// This method performs a GET request to the TVMaze API with the specified
  /// [id] parameter to search for a TV show. The response containing the
  /// fetched data is returned.
  ///
  /// Returns a [Future] that completes with the [Response] containing the fetched data.
  @override
  Future<Response<dynamic>> fetchShowById({required int id}) async => _client.get<dynamic>('/shows/$id');
}
