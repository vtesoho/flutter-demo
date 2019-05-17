import 'package:redux/redux.dart';
import 'app/AppState.dart';
import 'app/AppReducer.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.init(),
  );
}