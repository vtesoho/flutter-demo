
import 'package:redux/redux.dart';
import 'app/AppState.dart';


import './module/auth/action.dart';









Store<AppState> createStore() {
  Store<AppState> store = Store(
    appReducer,
    initialState: AppState.init(),
  );

  store.dispatch(LoginSuccessAction(account: 'accccc'));
  
  return store;
}
