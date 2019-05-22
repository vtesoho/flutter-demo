import 'dart:convert';
import '../../store/module/auth/action.dart';


class AnalyzeData {
  var store;
  AnalyzeData(this.store);
  
  start(data) {
    print('----------------------------$data');
    Map returnobject = json.decode(data);
    returnobject.forEach((key,value){
      switchData(key,value);
    });
  }

  //自行增加需要处理的case
  switchData(key,value){
    switch (key) {
      case 'test': //测试
        print('要执行的 test $value');
        break;
      case 'tabbarFollow':
        store.dispatch(LoginSuccessAction(account: '$value'));
        print('要执行的 $value');
        break;
    }
  }


  test(){
    print(store);
  }



}
