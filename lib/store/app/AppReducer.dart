import 'AppState.dart';
import '../module/auth/reducer.dart';


AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        authState: authStateReducer(state.authState,action),
        // mainPageState: mainPageReducer(state.mainPageState,action)
    );