class SingletonDemo {



  var store;
  factory SingletonDemo(data) => _getInstance(data);

  static SingletonDemo _instance;
  SingletonDemo._internal(data) {
    store = data;
    print('初始化没有？$store');
  }
  static SingletonDemo _getInstance(data){
    if (_instance == null) {
      print('初始化没有？$data');
      _instance = SingletonDemo._internal(data);
    }
    return _instance;
  }

  void test(){
    print('store-----_$store');
  }

}