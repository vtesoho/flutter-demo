import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}


class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('state management demo'),
        ),
        body: Counter(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:_increaseCount,
        ),
      ),
    );
  }
}


class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('data'),
      ),
    );
  }
}



class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) :super(child:child);

  static CounterProvider of(BuildContext context) => 
    context.inheritFromWidgetOfExactType(CounterProvider);
  
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}