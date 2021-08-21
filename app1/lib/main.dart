import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main() {
  runApp(Mlapp());
}

class Mlapp extends StatefulWidget {
  @override
  _MlappState createState() => _MlappState();
}

class _MlappState extends State<Mlapp> {
  var cmd;
  var result;
  web() async {
    var r = Uri.http("192.168.1.18", "/cgi-bin/app.py", {
      "a": batvalue,
      "b": bolvalue,
      "c": venuevalue,
      "d": _controller.text,
      "e": _controller1.text,
      "f": _controller2.text,
      "g": _controller3.text,
      "h": _controller4.text
    });
    var r1 = await http.get(r);
    print(batvalue);
    print(bolvalue);
    print(venuevalue);
    print(_controller.text);
    print(_controller1.text);
    print(_controller2.text);
    print(_controller3.text);
    print(_controller4.text);
    // print(r1.body);
    setState(() {
      result = r1.body;
    });
  }

  final battingteam = [
    'Chennai Super Kings',
    'Delhi Daredevils',
    'Kings XI Punjab',
    'Kolkata Knight Riders',
    'Mumbai Indians',
    'Rajasthan Royals',
    'Royal Challengers Bangalore',
    'Sunrisers Hyderabad'
  ];

  final bowlingteam = [
    'Chennai Super Kings',
    'Delhi Daredevils',
    'Kings XI Punjab',
    'Kolkata Knight Riders',
    'Mumbai Indians',
    'Rajasthan Royals',
    'Royal Challengers Bangalore',
    'Sunrisers Hyderabad'
  ];

  final venue = [
    'M Chinnaswamy Stadium',
    'Eden Gardens',
    'Feroz Shah Kotla',
    'MA Chidambaram Stadium, Chepauk',
    'PCA Stadium, Mohali',
    'Wankhede Stadium',
    'Sawai Mansingh Stadium',
    'RGI Stadium, Uppal'
  ];

  String? batvalue;
  String? bolvalue;
  String? venuevalue;

  var _controller = TextEditingController();
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  var _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("IPL Score Prediction App"),
            actions: [
              IconButton(
                onPressed: web,
                icon: Icon(Icons.alarm),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                child: Center(
                  child: DropdownButton<String>(
                    hint: Text("Select Team A"),
                    value: batvalue,
                    items: battingteam.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.batvalue = value),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: DropdownButton<String>(
                    hint: Text("Select Team B"),
                    value: bolvalue,
                    items: bowlingteam.map(buildMenuItem1).toList(),
                    onChanged: (value) => setState(() => this.bolvalue = value),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: DropdownButton<String>(
                    hint: Text("      Select The Desired Stadium"),
                    value: venuevalue,
                    items: venue.map(buildMenuItem2).toList(),
                    onChanged: (value) =>
                        setState(() => this.venuevalue = value),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Total Number Of Overs",
                      labelText: "Overs",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      hintText: "Runs",
                      labelText: "Runs",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                      hintText: "Wickets",
                      labelText: "Wickets",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: TextField(
                    controller: _controller3,
                    decoration: InputDecoration(
                      hintText: "Runs in previous 5 overs",
                      labelText: "Runs in previous 5 overs",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: TextField(
                    controller: _controller4,
                    decoration: InputDecoration(
                      hintText: "Wickets in previous 5 overs",
                      labelText: "Wickets in previous 5 overs",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                child: Center(
                    child: TextButton(
                  child: Text("RESULT",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  onPressed: () {},
                )),
              )),
            ],
          )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  DropdownMenuItem<String> buildMenuItem1(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  DropdownMenuItem<String> buildMenuItem2(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
