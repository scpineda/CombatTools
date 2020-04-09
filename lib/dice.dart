import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class DiceRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [DiceTitle(), instructions(), DiceRoll()],
          ),
        ));
  }
}

Widget DiceTitle() {
  return Container(
    margin: EdgeInsets.only(bottom: 50.0),
    child: Text('Dice Roller',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
  );
}

Widget instructions() {
  return Container(
    margin: const EdgeInsets.all(20.0),
    child: Text('Enter the amount of dice, the die number, and any modifiers',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
  );
}

// Widget Class
class DiceRoll extends StatefulWidget {
  @override
  _DiceRollState createState() => _DiceRollState();
}

// State class
class _DiceRollState extends State<DiceRoll> {
  @override
  String _numOfDice = "";
  String _dieFaces = "";
  String _mod = "0";
  String _result = "";

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(20.0),
                width: 75.0,
                child: Center(
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Num"),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String inp) {
                          setState(() {
                            _numOfDice = inp;
                          });
                        }))),
            Text(
              'd',
              style: TextStyle(fontSize: 35.0),
            ),
            Container(
                margin: const EdgeInsets.all(20.0),
                width: 75.0,
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Face"),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (String inp) {
                    setState(() {
                      _dieFaces = inp;
                    });
                  },
                ))),
            Text('+', style: TextStyle(fontSize: 35)),
            Container(
                margin: const EdgeInsets.all(20.0),
                width: 75.0,
                child: Center(
                    child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Mod"),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  onChanged: (String inp) {
                    setState(() {
                      _mod = inp;
                    });
                  },
                ))),
          ],
        ),
        RaisedButton(
          color: Colors.blue,
          onPressed: () {
            setState(() {
              _result = diceValue(_numOfDice, _dieFaces, _mod);
            });
          },
          child: Text(
            'Calculate',
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.blue,
            ),
          ),
          margin: const EdgeInsets.all(10.0),
          width: 90.0,
          height: 90.0,
          child: Center(
            child: Text(
              _result,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 35.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

String diceValue(String num, String face, String mod) {
  // Convert everything into numbers
  int intNum = int.parse(num);

  int intFace = int.parse(face);

  int intMod = int.parse(mod);

  // generate a random number
  var randomizer = new Random();
  int result = 0;
  var roll;

  for (int i = 0; i < intNum; ++i) {
    roll = randomizer.nextInt(intFace - 1) + 1;
    result += roll;
  }

  result += intMod;

  return result.toString();
}
