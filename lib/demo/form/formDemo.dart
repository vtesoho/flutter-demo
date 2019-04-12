import 'package:flutter/material.dart';


class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.red,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),      
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm () {
    if(registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();  //表示保存registerform里面的数据
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering...'),
        )
      );
    }else{
      setState(() {
       autovalidate = true;    //动态设置表单验证
      });
    }
    
    // registerFormKey.currentState.validate();  //全局执行一下vaildate
  }

  String validatorUsername(value) {
    if(value.isEmpty){
      return 'username is required';
    }
    return null;
  }

  String validatorPassword(value) {
    if(value.isEmpty){
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,  //通过创建GlobalKey来获取表单值
      child: Column(
        children: <Widget>[
          TextFormField(  //文本输入框
            decoration: InputDecoration(  //文本框装饰器
              labelText: 'Username',  //设置标签
              helperText: '',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validatorUsername,  //验证表单
            autovalidate: autovalidate,  //自动验证表单
          ),
          TextFormField(  //文本输入框
            obscureText: true,  //隐藏输入字符，一般用于密码
            decoration: InputDecoration(  //文本框装饰器
              labelText: 'Username',  //设置标签
              helperText: '',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatorPassword,  //验证表单
            autovalidate: autovalidate,  //自动验证表单
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,  //表示宽度无限大
            child: RaisedButton(
              color: Theme.of(context).accentColor,  //使用主题定义的颜色
              child: Text('Register'),
              elevation: 0.0,  //阴影设置为0
              onPressed: submitRegisterForm,  
            ),
          )
        ],
      ),
      
    );
  }
}


class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {

  final textEditingController = TextEditingController();  //给文本框创建控制器

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi';  //设置文本初始的值
    textEditingController.addListener(  //设置监听器，文本框有变化就执行里面的方法
      () {

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,  //设置控制器
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'user',
        hintText: 'Enter the post user',
        // border: InputBorder.none, //取消边框
        // border: OutlineInputBorder()  //四周边框
        filled: true,  
        fillColor: Colors.black12,  //设置背景颜色
      ),
      // onChanged: (value) {  //文本框每次输入的值

      // },
      onSubmitted: (value) {  //按下确定按纽后的值
        
      },
    );
  }
}


class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

