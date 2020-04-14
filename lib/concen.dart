import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConcenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [concenTitle(), instructions(), Percentage()],
          ),
        ));
  }
}

Widget concenTitle() {
  return Container(
    margin: EdgeInsets.only(bottom: 50.0),
    child: Text('Concentration Check',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
  );
}

Widget instructions() {
  return Container(
    margin: const EdgeInsets.all(20.0),
    child: Text('Enter damage done by single hit.',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
  );
}

// widget class
class Percentage extends StatefulWidget {
  @override
  _PercentageState createState() => _PercentageState();
}

// state class
class _PercentageState extends State<Percentage> {
  @override
  String _result = "";

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(25.0),
          width: 100.0,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Dmg."),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              onSubmitted: (String str) {
                setState(() {
                  str = conValue(str);
                  _result = str;
                });
              }, // Only numbers can be entered
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Text('To keep Concentration, you must roll at least a...',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.purple,
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
                fontSize: 45.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ); // widget layout
  }
}

String conValue(String text) {
  // Grab the damage value given
  int damage = int.parse(text.toString());

  if (damage > 10)
    return (damage / 2).floor().toString();
  else
    return 10.toString();
}
