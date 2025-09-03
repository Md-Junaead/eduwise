// A tiny, explicit state machine for view models – keeps UI logic simple.

enum AppStatus { idle, loading, success, error }

class AppState {
  final AppStatus status; // Current status of the screen
  final String? message;  // Optional message (e.g., error text)

  const AppState({this.status = AppStatus.idle, this.message});

  bool get isBusy => status == AppStatus.loading;

  AppState copyWith({AppStatus? status, String? message}) => AppState(
        status: status ?? this.status,
        message: message,
      );
}
