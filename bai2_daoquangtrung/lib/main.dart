import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello App'),
          ),
          body: Center(
            child: Text('Hello World'),
          ),
        ));
  }
}

class _MyAppState extends State<MyApp> {
  String text = '';
  var numberrandom = new Random();

  int number = 0;

  @override
  void initState() {
    text = 'initState: Hello World!';
    super.initState();
  }

  void btnTaped() {
    setState(() {
      text = 'setState: Hi eceryone!';
      number = numberrandom.nextInt(100); // random number from 0 to 99
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                Text('Your lucky number: ' + number.toString()),
                ElevatedButton(onPressed: btnTaped, child: Text('Tap me!'))
              ],
            ),
          ),
        ));
  }
}
