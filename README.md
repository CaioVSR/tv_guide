
# TV Guide

TV Guide is a Flutter project designed to provide users with a comprehensive TV guide. This project follows best practices in Flutter development.

## Features

- **Splash Screen**: A splash screen displayed when the app is launched.
- **Login Screen**: A login screen where users must enter "admin" as the username and "admin" as the password to proceed.
- **Persistent Login State**: The app remembers the login state, so the user doesn't need to log in again upon restarting the app.
- **Home Screen**: A home screen with a search bar and a list of TV shows.
- **API Integration**: The list of TV shows is fetched from the TVMaze API.
- **Details Screen**: When a user taps on a TV show, they are taken to a details screen that shows more information about the show.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have the following installed:
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- IDE: [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository:**
    ```sh
    git clone https://github.com/CaioVSR/tv_guide.git

    cd tv_guide
    ```

2. **Install dependencies:**
    ```sh
    flutter pub get
    ```

3. **Create the App launcher icons:**
    ```sh
    dart run flutter_launcher_icons
    ```

4. **Create secrets.json file with the following content:**
    ```json
    {
      "API_BASE_URL": "https://api.tvmaze.com"
    }
    ```

4. **Run the application passing the dar define instructions:**
    ```sh
    flutter run --dart-define-from-file=secrets.json
    ```

5. **Provide the user credentials at the Login Page**
  - **email:** admin@admin.com
  - **password:** admin

## Dependencies

The project uses the following dependencies:

- **bloc:** ^8.1.4
- **cached_network_image:** ^3.3.1
- **cupertino_icons:** ^1.0.6
- **dio:** ^5.5.0+1
- **equatable:** ^2.0.5
- **flutter_bloc:** ^8.1.6
- **flutter_secure_storage:** ^9.2.2
- **get_it:** ^7.7.0
- **go_router:** ^14.2.1
- **google_fonts:** ^6.2.1
- **heroicons_flutter:** ^0.3.0
- **html_tags_cleaner:** ^0.0.3
- **loading_animation_widget:** ^1.2.1
- **meta:** ^1.12.0

## Dev Dependencies

- **bloc_test:** ^9.1.7
- **flutter_launcher_icons:** ^0.13.1
- **flutter_lints:** ^3.0.0
- **flutter_test:** Included with Flutter SDK
- **mocktail:** ^1.0.4
- **very_good_analysis:** ^6.0.0

## State Management and Architecture

This project uses the BLoC (Business Logic Component) pattern for state management. BLoC helps to separate business logic from the UI, making the app more scalable and easier to maintain.

### Key Points of the Architecture:
- **BLoC:** Manages the state of the application.
- **Dependency Injection:** Using `get_it` to manage dependencies.
- **Routing:** Managed by `go_router` for efficient navigation.
- **Network Requests:** Handled by `dio` for HTTP client features.

## Running Code Coverage Report

To run the code coverage report, follow these steps:

### Prerequisites

- **Make:** Ensure `make` is installed on your system. It is typically available on Unix-based systems like macOS and Linux.
- **LCOV:** You need `lcov` to generate the coverage report. Install it using the package manager for your operating system.

#### macOS:
```sh
brew install lcov
```

#### Linux (Debian-based):
```sh
sudo apt-get install lcov
```

**Note:** Code coverage report generation does not work on Windows due to the lack of native support for some of the tools used. Consider using WSL (Windows Subsystem for Linux) or running the commands on a Unix-based system.

### Commands

For your convenience a `makefile` is provided to automate the process of running tests and generating the code coverage report.

**Run the coverage tests:**
```sh
  make tests
```

Or you can run the following commands manually:
```sh
  flutter test --coverage
  lcov --remove coverage/lcov.info 'lib/*' -o coverage/lcov.info
  genhtml coverage/lcov.info -o coverage/html
```

---

# TV Guide App - Thought Process

### 1. Understanding Requirements

The first step was to thoroughly understand the requirements of the coding challenge. The key features identified were:

	•	Splash Screen
	•	Login Screen with hardcoded credentials
	•	Persistent login state
	•	Home Screen with a search bar and a list of TV shows fetched from an API
	•	Details Screen for showing more information about a selected TV show

### 2. UI Design and Navigation Flow

Visualize the app’s user interface and navigation flow. Plan the screens, widgets, and interactions to ensure a seamless user experience.

	•	Find good design inspiration
	•	Plan the layout and navigation flow
	•	Identify key components and interactions
	•	Draw some sketches on a paper

### 3. Project Structure and Clean Architecture

To ensure scalability and maintainability, I followed Clean Architecture principles. This approach divides the project into different layers, each with a clear responsibility:

	•	Core: Contains fundamental elements like models, services, and entities that are used across the app.
	•	App: Contains application-wide configurations, widgets, and routing.
	•	Features: Divides the application into feature-specific components (e.g., splash, home, auth).

### 4. Implementing Features

#### Splash Screen

The splash screen was implemented to provide an initial loading screen when the app launches while fetching for local auth data. It was set as the initial route in the app’s routing configuration.

#### Login Screen

- The login screen included a simple form for username and password validation. Hardcoded credentials ("admin@admin.com" for username and  "admin" password) were used to allow access.

- Persistent Login State

  - To manage the login state, I used a secure local storage solution. The login state is stored upon successful login and checked during the app launch to determine the initial route.

#### Home Screen

- The home screen featured a search bar and a list of TV shows. The list was populated by making API calls to the TVMaze API. Each item in the list displayed a thumbnail image and a title.

- You can search for TV shows by typing in the search bar. The list updates in real-time based on the search query.

- A logout button was included in the app bar to allow users to log out and clear the login state.

#### Details Screen

- When a user taps on a TV show in the list, they are navigated to the details screen. This screen fetched additional information about the selected show from the TVMaze API.

### 5. API Integration

I used the TVMaze API to fetch TV show data. The https package was utilized to handle HTTP requests. The data from the API was parsed and displayed in the app.

### 6. User Interface

While implementing the UI, I aimed for a clean and user-friendly design. I used Flutter’s widget library to build responsive and visually appealing interfaces for each screen.

### 7. Testing

Unit tests were written to ensure the functionality of critical components. Code coverage reports were generated to track the test coverage and identify areas that need more testing.

### 8. Documentation

To ensure ease of understanding and reproducibility, All classes and methods were documented using comments. The project README was updated with detailed instructions on how to run the app and generate code coverage reports.

### 9. Final Touches

After completing the implementation and testing, I made sure to review and refine the code for readability and adherence to best practices.

--- 

This presentation summarizes my thought process and approach while working on the TV Guide App coding challenge. Please feel free to reach out if you have any questions or need further clarification.

Please review and let me know if there are any further updates or changes needed.