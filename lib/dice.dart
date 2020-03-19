import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiceRoller extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiceTitle(),
              instructions(),
              DiceRoll()
            ],
          ),
        )
    );
  }
}

Widget DiceTitle()
{
  return Container(
    margin: EdgeInsets.only(bottom: 50.0),
    child: Text(
        'Dice Roller',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0)
    ),
  );
}

Widget instructions()
{
  return Container(
    margin: const EdgeInsets.all(20.0),
    child: Text(
        'Enter the amount of dice, the die number, and any modifiers',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0)
    ),
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

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly], // Only numbers can be entered
              onChanged: (String change)
              {
                setState(() {
                  _numOfDice = change;
                });
              },
            ),
            Text(
              'd'
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly], // Only numbers can be entered
              onChanged: (String change)
              {
                setState(() {
                  _dieFaces = change;
                });
              },
            ),
            Text(
              '+'
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly], // Only numbers can be entered
              onChanged: (String change)
              {
                setState(() {
                  _mod = change;
                });
              },
            )
          ],
        )
      ],
    );
  }
}