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
              new TextFormField()
            ],
          ),
        )
    );
  }
}

Widget instructions()
{
  return Text(
    'Enter damage done by single hit. Remember that you must make one CON Save per single attack.',
    textAlign: TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.bold)
  );
}

