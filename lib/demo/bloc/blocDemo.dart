import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/bloc/countHome.dart';

class BlocDemo extends StatelessWidget {
  const BlocDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc'),
          elevation: 0.0,
        ),
        body: CounteHome(),
        floatingActionButton: CounteActionButton(),
      ),
    );
  }
}
