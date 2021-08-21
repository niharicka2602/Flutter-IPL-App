import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  web() async {
    var r = Uri.http("192.168.99.104", "/cgi-bin/app.py");
    var r1 = await http.get(r);
    print(r1.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Machine Learning App"),
        ),
        body: Center(
          child: UpdateText(),
        ),
      ),
    );
  }
}

class UpdateText extends StatefulWidget {
  @override
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  String textHolder = 'Old Sample Text...!!!';

  changeText() {
    setState(() {
      textHolder = 'New Sample Text...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('$textHolder', style: TextStyle(fontSize: 21))),
      // ignore: deprecated_member_use
      RaisedButton(
        onPressed: () => changeText(),
        child: Text('Click Here To Change Text Widget Text Dynamically'),
        textColor: Colors.white,
        color: Colors.green,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
    ])));
  }
}
