class PublistStatus {

  bool _processStatus;
  factory PublistStatus() => _getInstance();

  static PublistStatus _instance;
  PublistStatus._internal() {
    // print('初始化没有？');
  }
  static PublistStatus _getInstance(){
    if (_instance == null) {
      _instance = PublistStatus._internal();
    }
    return _instance;
  }

  void test(){
    print('store-----$_processStatus');
  }
  set setPublistStatus(data) => _processStatus = data;
  get getPublistStatus => _processStatus;
}