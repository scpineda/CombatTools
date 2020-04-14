import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class StatsRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [StatsTitle(), instructions(), StatsRoll()],
          ),
        ));
  }
}

Widget StatsTitle() {
  return Container(
    margin: EdgeInsets.only(bottom: 50.0),
    child: Text('Stats Roller',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
  );
}

Widget instructions() {
  return Container(
    margin: const EdgeInsets.all(20.0),
    child: Text(
        'Choose which way you would like to roll for stats. First way is standard 3d6 no dropping. Second is 4d6 drop the lowest roll. Third is 4d6, drop lowest and reroll all 1s',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
  );
}

// Widget Class
class StatsRoll extends StatefulWidget {
  @override
  _StatRollState createState() => _StatRollState();
}

class _StatRollState extends State<StatsRoll> {
  @override
  String _stat1 = "";
  String _stat2 = "";
  String _stat3 = "";
  String _stat4 = "";
  String _stat5 = "";
  String _stat6 = "";

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              width: 90.0,
              height: 90.0,
              child: Center(
                child: Text(
                  _stat1,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              width: 90.0,
              height: 90.0,
              child: Center(
                child: Text(
                  _stat2,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              width: 90.0,
              height: 90.0,
              child: Center(
                child: Text(
                  _stat3,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              width: 90.0,
              height: 90.0,
              child: Center(
                child: Text(
                  _stat4,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              width: 90.0,
              height: 90.0,
              child: Center(
                child: Text(
                  _stat5,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              margin: const EdgeInsets.all(10.0),
              width: 90.0,
              height: 90.0,
              child: Center(
                child: Text(
                  _stat6,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 45.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.yellow,
              onPressed: () {
                setState(() {
                  _stat1 = standardRoll();
                  _stat2 = standardRoll();
                  _stat3 = standardRoll();
                  _stat4 = standardRoll();
                  _stat5 = standardRoll();
                  _stat6 = standardRoll();
                });
              },
              child: Text(
                '3d6',
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              color: Colors.yellow,
              onPressed: () {
                setState(() {
                  _stat1 = dlOneRoll();
                  _stat2 = dlOneRoll();
                  _stat3 = dlOneRoll();
                  _stat4 = dlOneRoll();
                  _stat5 = dlOneRoll();
                  _stat6 = dlOneRoll();
                });
              },
              child: Text('4d6dl1', style: TextStyle(color: Colors.black)),
            ),
            RaisedButton(
              color: Colors.yellow,
              onPressed: () {
                setState(() {
                  _stat1 = rerollOneRoll();
                  _stat2 = rerollOneRoll();
                  _stat3 = rerollOneRoll();
                  _stat4 = rerollOneRoll();
                  _stat5 = rerollOneRoll();
                  _stat6 = rerollOneRoll();
                });
              },
              child: Text('4d6dl1r1', style: TextStyle(color: Colors.black)),
            )
          ],
        )
      ],
    );
  }
}

String standardRoll() {
  // Returns a regular 3d6
  // generate a random number
  var randomizer = new Random();
  int result = 0;
  var roll;

  for (int i = 0; i < 3; ++i) {
    roll = randomizer.nextInt(6 - 1) + 1;
    result += roll;
  }

  return result.toString();
}

String dlOneRoll() {
  // Returns a regular 3d6
  // generate a random number
  var randomizer = new Random();
  int result = 0;
  var roll;

  // initialize lowest
  var lowest = 7;

  // Get all
  for (int i = 0; i < 4; ++i) {
    roll = randomizer.nextInt(6 - 1) + 1;

    // keep track of the lowest one
    if (roll < lowest) lowest = roll;

    result += roll;
  }

  // Drop the lowest result.
  result -= lowest;

  return result.toString();
}

String rerollOneRoll() {
  // Returns a regular 3d6
  // generate a random number
  var randomizer = new Random();
  int result = 0;
  var roll;

  // initialize lowest
  var lowest = 7;

  // Get all
  for (int i = 0; i < 4; ++i) {
    roll = randomizer.nextInt(6 - 1) + 1;

    while (roll == 1) roll = randomizer.nextInt(6 - 1) + 1;

    // keep track of the lowest one
    if (roll < lowest) lowest = roll;

    result += roll;
  }

  // Drop the lowest result.
  result -= lowest;

  return result.toString();
}
