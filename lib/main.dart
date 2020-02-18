// Combat Tools

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/concen.dart';
import 'package:flutter/services.dart';

// Run the app. You can use => for single line
void main() {
  runApp(MaterialApp(
    title: 'CombatTools',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => StartScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => ConcenPage(),
    },
  ));
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            children: [
              Flexible(flex: 1, child: titleSection),
              Flexible(flex: 1, child: buttonSection1(context)),
              Flexible(flex: 1, child: buttonSection2(context)),
              Flexible(flex: 1, child: buttonSection3(context))
            ],
          ),
        ));
  }
}

// Title Widget
Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Combat Tools',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Container _buildButtonColumn(Color color, IconData iconD, String labelL, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    width: 160.0,
    height: 160.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: color,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: Icon(iconD),
            iconSize: 45.0,
            tooltip: labelL,
            color: color,
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            }),
        Text(labelL, style: TextStyle(
            color: color,
            fontSize: 30.0)
        )
      ],
    ),
  );
}

Widget buttonSection1(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.green, Icons.add_alert, 'Hit', context),
        _buildButtonColumn(Colors.red, Icons.face, 'Save', context),
      ],
    ),
  );
}

Widget buttonSection2(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue, Icons.call, 'Mon-Save', context),
        _buildButtonColumn(Colors.purple, Icons.account_box, 'Con.', context),
      ],
    ),
  );
}

Widget buttonSection3(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.yellow, Icons.casino, 'Dice Roller', context),
      ],
    ),
  );
}

