import 'package:redux/redux.dart';
import './action.dart';
import './state.dart';

final authStateReducer = combineReducers<AuthState>([
  TypedReducer<AuthState,AuthStateAction>(_increase)
]);

AuthState _increase (AuthState state, AuthStateAction action) {
  state.isLogin = true;
  return state;
}