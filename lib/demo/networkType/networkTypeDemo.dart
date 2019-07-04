import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
class NetworkTypeDemo extends StatefulWidget {
  NetworkTypeDemo({Key key}) : super(key: key);

  _NetworkTypeDemoState createState() => _NetworkTypeDemoState();
}

class _NetworkTypeDemoState extends State<NetworkTypeDemo> {
  String networkType = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetworkType'),
      ),
      body: Container(
        child: Text(networkType),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          isConnected().then((onValue){
            networkType = onValue;
            setState(() {
              
            });
          });
        },
      ),
    );
  }

  Future<String> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return 'mobile';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return 'wifi';
    }else if(connectivityResult == ConnectivityResult.none){
      return 'none';
    }
    
  }
}