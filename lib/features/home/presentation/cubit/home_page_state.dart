part of 'home_page_cubit.dart';

/// Enum representing the status of the home page.
///
/// The [HomePageStatus] enum defines the various states the home page can be in:
/// - [initial]: The initial state before any data is loaded.
/// - [loadInProgress]: The state when data is currently being loaded.
/// - [loadSuccess]: The state when data has been successfully loaded.
/// - [loadFailure]: The state when there was an error loading the data.
enum HomePageStatus {
  /// The initial state before any data is loaded.
  initial,

  /// The state when data is currently being loaded.
  loadInProgress,

  /// The state when data has been successfully loaded.
  loadSuccess,

  /// The state when there was an error loading the data.
  loadFailure;

  /// Returns `true` if the status is [HomePageStatus.initial].
  bool get isInitial => this == HomePageStatus.initial;

  /// Returns `true` if the status is [HomePageStatus.loadInProgress].
  bool get isLoadInProgress => this == HomePageStatus.loadInProgress;

  /// Returns `true` if the status is [HomePageStatus.loadSuccess].
  bool get isLoadSuccess => this == HomePageStatus.loadSuccess;

  /// Returns `true` if the status is [HomePageStatus.loadFailure].
  bool get isLoadFailure => this == HomePageStatus.loadFailure;
}

/// State class for the home page.
///
/// The [HomePageState] class holds the current status of the home page. It is immutable
/// and can be copied with modifications using the [copyWith] method.
class HomePageState {
  /// Creates an instance of [HomePageState].
  ///
  /// The [pageStatus] parameter is required to indicate the current status of the home page.
  /// The [logOutStatus] parameter is optional and defaults to [HomePageStatus.initial].
  const HomePageState({
    required this.pageStatus,
    required this.logOutStatus,
    required this.showsList,
  });

  /// Factory constructor for the initial state of the home page.
  ///
  factory HomePageState.initial() {
    return const HomePageState(
      pageStatus: HomePageStatus.initial,
      logOutStatus: HomePageStatus.initial,
      showsList: [],
    );
  }

  /// The current status of the home page.
  final HomePageStatus pageStatus;

  /// The status of the log out operation.
  final HomePageStatus logOutStatus;

  /// The list of shows displayed on the home page.
  final List<ShowSummaryEntity> showsList;

  /// Creates a copy of the current [HomePageState] with the given modifications.
  ///
  /// This method allows for creating a new [HomePageState] instance with modified values while
  /// retaining the values of the other fields that are not changed.
  ///
  /// Parameters:
  /// - [pageStatus]: The new status for the home page. If not provided, the current status is retained.
  /// - [logOutStatus]: The new status for the log out operation. If not provided, the current status is retained.
  ///
  /// Returns:
  /// A new instance of [HomePageState] with the specified modifications.
  HomePageState copyWith({
    HomePageStatus? pageStatus,
    HomePageStatus? logOutStatus,
    List<ShowSummaryEntity>? showsList,
  }) {
    return HomePageState(
      pageStatus: pageStatus ?? this.pageStatus,
      logOutStatus: logOutStatus ?? this.logOutStatus,
      showsList: showsList ?? this.showsList,
    );
  }
}
