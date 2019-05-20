
import 'package:fluttershuachi/demo/websocker/state.dart';
import 'package:redux/redux.dart';
import 'app/AppState.dart';







Store<AppState> createStore() {
  Store<AppState> store = Store(
    appReducer,
    initialState: AppState.init(),
  );

  WebSocketState webSocketState = WebSocketState(store:store);
  webSocketState.start();
  
  return store;
}
