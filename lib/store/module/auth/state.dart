class AuthState {
  bool isLogin;
  String account;
  AuthState({this.isLogin,this.account});

  @override
  String toString() {
    return '{account:$account,isLogin:$isLogin}';
  }

  factory AuthState.init() {
    return new AuthState(
      isLogin:false,
      account:null,
    );
  }

}