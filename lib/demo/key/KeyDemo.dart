
import 'package:flutter/material.dart';

class KeyDemo extends StatefulWidget {
  
  KeyDemo({Key key}) : super(key: key);

  
  _KeyDemoState createState() => _KeyDemoState();
}


class _KeyDemoState extends State<KeyDemo> {
  var key = ObjectKey('a');

  void ssss(val) {
    print('val ${val}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('key'),
      ),
      body: Container(
        key: key,
        child: Container(
          width: 50,
          child: HeightReporter(
            child: Text(
              'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata'
            ),
            fn: (value) => ssss(value),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print(key);
          // print(key.currentContext.size.height);
        },
      ),
    );
  }
}

class HeightReporter extends StatefulWidget {
  Widget child;
  var fn;
  HeightReporter({Key key,this.child,this.fn}) : super(key: key);

  _HeightReporterState createState() => _HeightReporterState();
}

class _HeightReporterState extends State<HeightReporter> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      widget.fn != null ? widget.fn(context.size.height) : print('object') ;
      print("Frame has been rendered");
    });
  }
  // widget.fn != null ? widget.fn(context.size.height) : print('object') ;
  // @override
  // void didChangeDependencies() {
  //   widget.fn != null ? widget.fn(context.size.height) : print('object') ;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // widget.fn();
    print('build');
    return GestureDetector(
      child: widget.child,
      onTap: () {
        print('Height is ${context.size.height}');
        print('Height is ${context.size.width}');
      },
    );
  }
}
