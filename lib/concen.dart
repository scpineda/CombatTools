import 'package:flutter/services.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConcenPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            children: [
              titleSection,
              instructions(),
              enterButton(),
              result(),
              percentageField()
            ],
          ),
        )
    );
  }
}

Widget instructions()
{
  return Text(
      'Enter damage done by single hit.',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold)
  );
}

Widget result()
{
  return Text(
      'To keep Concentration, you must roll at least a...',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold)
  );
}

Widget enterButton() {
  return TextField(
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Enter your number"),
    keyboardType: TextInputType.number,
    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly] ,
    onChanged: (text) {

    },// Only numbers can be entered
  );
}

Widget percentageField() {
  return Container(
    margin: const EdgeInsets.all(10.0),
    color: Colors.white,
    width: 108.0,
    height: 108.0,
    child: Text('NaN'
    ),
  );
}

int conValue(Text text)
{
  // Grab the damage value given
  int damage = int.parse(text.toString());

  if(damage > 10)
    return (damage / 2).floor();

  else
    return 10;
}