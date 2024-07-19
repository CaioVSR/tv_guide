part of 'splash_page_cubit.dart';

@immutable
/// Represents the state of the splash page.
sealed class SplashPageState {}

/// Represents the initial state of the splash page.
class SplashInitial extends SplashPageState {}

/// Represents the loading state of the splash page.
class SplashLoading extends SplashPageState {}

/// Represents the state when the user is authenticated.
class SplashAuthenticated extends SplashPageState {}

/// Represents the state when the user is unauthenticated.
class SplashUnauthenticated extends SplashPageState {}
