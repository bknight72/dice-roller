import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Ben\'s Dicee'),
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  Future<void> rollDice() async {
    for (int i = 0; i < 10; i++) {
      setState(() {
        rightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = Random().nextInt(6) + 1;
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
    setState(() {
      rightDiceNumber = Random().nextInt(7) + 1;
      leftDiceNumber = Random().nextInt(7) + 1;
    });
    //print("Rolling the dice...");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(16.0),
              ),
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                rollDice();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(16.0),
              ),
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: () {
                rollDice();
              },
            ),
          )
        ],
      ),
    );
  }
}
