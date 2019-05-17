import 'package:redux/redux.dart';
import './action.dart';
import './state.dart';

final authStateReducer = combineReducers<AuthState>([
  TypedReducer<AuthState,LogoutSuccess>(_logoutSuccess),
  TypedReducer<AuthState,LoginSuccessAction>(_loginSuccessAction),

]);

AuthState _logoutSuccess (AuthState state, LogoutSuccess action) {
  state.isLogin = false;
  state.account = null;
  return state;
}

AuthState _loginSuccessAction (AuthState state, LoginSuccessAction action) {
  state.account = action.account;
  state.isLogin = true;
  return state;
}