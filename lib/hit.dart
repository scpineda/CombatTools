import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [HitTitle(), instructions(), HitCalc()],
          ),
        ));
  }
}

Widget HitTitle() {
  return Container(
    margin: EdgeInsets.only(bottom: 50.0),
    child: Text('Hit Percentage',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)),
  );
}

Widget instructions() {
  return Container(
    margin: const EdgeInsets.all(20.0),
    child: Text(
        'Enter Enemy AC and Attack Modifier. Then, press the submit button.',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
  );
}

Widget resultText() {
  return Container(
    margin: const EdgeInsets.all(20.0),
    child: Text('Your chance of hitting is...',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
  );
}

// Widget Class
class HitCalc extends StatefulWidget {
  @override
  _HitCalcState createState() => _HitCalcState();
}

// State class
class _HitCalcState extends State<HitCalc> {
  @override
  String _result = "";
  String _ac = "";
  String _hit = "";

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          margin: const EdgeInsets.all(25.0),
          width: 100.0,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "AC"),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              onChanged: (String acInp) {
                setState(() {
                  _ac = acInp;
                });
              },
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25.0),
          width: 100.0,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Hit"),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              onChanged: (String acInp) {
                setState(() {
                  _hit = acInp;
                });
              }, // Only numbers can be entered
            ),
          ),
        )
      ]),
      RaisedButton(
        color: Colors.green,
        onPressed: () {
          setState(() {
            _result = hitValue(_ac, _hit);
          });
        },
        child: Text(
          'Calculate',
        ),
      ),
      resultText(),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.green,
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
      ),
    ]);
  }
}

String hitValue(String ac, String hit) {
  // Grab the ac value
  double acNum = double.parse(ac.toString());

  // Grab the hit value
  double hitNum = double.parse(hit.toString());

  // calculate
  double result = (((20 - (acNum - hitNum)) / 20) * 100);

  // Send result
  result.floor();
  return result.toString() + "%";
}
