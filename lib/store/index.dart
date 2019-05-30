
import 'package:fluttershuachi/demo/websocker/analyzeData.dart';
import 'package:fluttershuachi/demo/websocker/webSocket.dart';
import 'package:redux/redux.dart';
import 'app/AppState.dart';







Store<AppState> createStore() {
  Store<AppState> store = Store(
    appReducer,
    initialState: AppState.init(),
  );
  // AnalyzeData analyzeData = AnalyzeData(store);
  // WebSocketState webSocketState = WebSocketState(store:store,analyzeData:analyzeData);
  // webSocketState.start();
  
  return store;
}
