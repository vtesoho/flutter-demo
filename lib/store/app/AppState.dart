import '../module/auth/state.dart';
import '../module/auth/reducer.dart';

class AppState {
  final AuthState authState;
  // final MainPageState mainPageState;

  AppState({
    this.authState,
    // this.mainPageState
  });

  factory AppState.init() {
    return AppState(
      authState: AuthState.init(),
      // mainPageState: MainPageState.initial()
    );
  }
}

AppState appReducer(AppState state, dynamic action) => new AppState(
      authState: authStateReducer(state.authState, action),
      // mainPageState: mainPageReducer(state.mainPageState,action)
    );
