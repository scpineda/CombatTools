// Combat Tools
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/concen.dart';
import 'package:flutter_app/hit.dart';
import 'package:flutter_app/save.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/dice.dart';
import 'package:flutter_app/stats.dart';

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
      '/third': (context) => HitPage(),
      '/fourth': (context) => SavePage(),
      '/fifth': (context) => DiceRoller(),
      '/sixth': (context) => StatsRoller()
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.all(8),
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

Container _buildButtonColumn(
    Color color, String imagePath, String labelL, BuildContext context) {
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
    child: FlatButton(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 50.0, width: 50.0),
            Text(
              labelL,
              style: TextStyle(color: color, fontSize: 30.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
        onPressed: () {
          switch (labelL) {
            case 'Hit':
              Navigator.pushNamed(context, '/third');
              break;

            case 'Con.':
              Navigator.pushNamed(context, '/second');
              break;

            case 'Save':
              Navigator.pushNamed(context, '/fourth');
              break;

            case 'Dice Roller':
              Navigator.pushNamed(context, '/fifth');
              break;

            case 'Stats Roller':
              Navigator.pushNamed(context, '/sixth');
              break;
          }
        }),
  );
}

Widget buttonSection1(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
            Colors.green, 'assets/images/hit.png', 'Hit', context),
        _buildButtonColumn(
            Colors.red, 'assets/images/save.png', 'Save', context),
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
        _buildButtonColumn(
            Colors.blue, 'assets/images/dice.png', 'Dice Roller', context),
        _buildButtonColumn(
            Colors.purple, 'assets/images/concen.png', 'Con.', context),
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
        _buildButtonColumn(
            Colors.yellow, 'assets/images/stats.png', 'Stats Roller', context)
      ],
    ),
  );
}
