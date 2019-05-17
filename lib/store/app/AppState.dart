import '../module/auth/state.dart';

class AppState {
  final AuthState authState;
  // final MainPageState mainPageState;

  AppState({
    this.authState,
    // this.mainPageState
  });

  factory AppState.init(){
    return AppState(
      authState: AuthState.init(),
      // mainPageState: MainPageState.initial()
    );
  }
}