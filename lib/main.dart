// Combat Tools

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/concen.dart';
import 'concen.dart';

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
              titleSection,
              buttonSection1,
              buttonSection2,
              buttonSection3,
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

Column _buildButtonColumn(Color color, IconData iconD, String labelL) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          icon: Icon(iconD),
          tooltip: labelL,
          color: color,
          onPressed: () {
            switch (labelL) {
              case 'Hit':
                break;
              case 'Save':
                break;
              case 'Mon-Save':
                break;
              case 'Con.':
                ConcenPage();
                break;
              case 'Dive Roller':
                break;
            }
          }),
      Text(labelL, style: TextStyle(color: color))
    ],
  );
}

Widget buttonSection1 = Container(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.green, Icons.add_alert, 'Hit'),
      _buildButtonColumn(Colors.red, Icons.face, 'Save'),
    ],
  ),
);

Widget buttonSection2 = Container(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.blue, Icons.call, 'Mon-Save'),
      _buildButtonColumn(Colors.purple, Icons.account_box, 'Con.'),
    ],
  ),
);

Widget buttonSection3 = Container(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.yellow, Icons.casino, 'Dice Roller'),
    ],
  ),
);

