
import 'package:flutter/material.dart';

class RegExpDemo extends StatefulWidget {
  RegExpDemo({Key key}) : super(key: key);

  _RegExpDemoState createState() => _RegExpDemoState();
}

class _RegExpDemoState extends State<RegExpDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchStr();
  }

  void searchStr(){
    String text = '[{msg=messageId={sdm01502558669116902f9},title={333333},content={测试通知133333},styleContent={null},inboxStyleContent={null},extrasMap={{__target_name=41Q8ma8A3a9Z7mGfEtdsdTtz4wDMctucwzhOJAjY8j6pj8Ms+H2ZSz2OrghQ3h/k, jumpdata=n2221, workId=5ce7673c7d5d793b9e6bbffc}},timestamp={0},voice={true},shake={false},light={false},style={0},channel={2}}]';
    List splitOne = text.split("jumpdata=");
    List splitTwo = splitOne[1].split(',');
    print(splitTwo[0]);
    // RegExp exp = new RegExp(r".jumpdata=.");
    // Iterable<Match> mobiles = exp.allMatches(text);
    // for (Match m in mobiles) {
    //   String match = m.group(0);
    //   print(match);
    // }

    // print('regexp ${exp.hasMatch(text)}');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('routerDemoa'),
      ),
      body: Text('data'),
    );
  }
}

