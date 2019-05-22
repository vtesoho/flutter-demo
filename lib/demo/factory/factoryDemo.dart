class Manager {
  String test;
  // 工厂模式
  factory Manager() =>_getInstance();
  static Manager get instance => _getInstance();
  static Manager _instance;
  Manager._internal(val) {
    // 初始化
    test = val;
  }
  static Manager _getInstance() {
    if (_instance == null) {
      _instance = new Manager._internal('test');
    }
    return _instance;
  }
}


Manager manager = new Manager();


Manager manager2 = Manager.instance;
