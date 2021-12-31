import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Hello App'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ));
  }
}

class _MyAppState extends State<MyApp> {
  @override
  String text = '';
  var numberrandom = new Random();

  int number1 = 0;
  int number2 = 0;

  void initState() {
    text = 'initState: Hello World!';
    super.initState();
  }

  void btnTaped() {
    setState(() {
      text = 'setState: Hi eceryone!';
      number1 = numberrandom.nextInt(7) + 1;
      number2 = numberrandom.nextInt(7) + 1; // random number from 1 to 6
    });
  }

  dynamic listImagesnotFound = [
    "assets/image/1.png",
    "assets/image/2.png",
    "assets/image/3.png",
    "assets/image/4.png",
    "assets/image/5.png",
    "assets/image/6.png",
  ];

  late Random rnd;

  Image img() {
    int min = 0;
    int max = listImagesnotFound.length - 1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name = listImagesnotFound[r].toString();
    return Image.asset(
      image_name,
      fit: BoxFit.contain,
      width: 100,
    );
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
                Image.asset(
                  'assets/image/diceeLogo.png',
                  fit: BoxFit.contain,
                  width: 300,
                ),
                img(),
                img(),
                //Image.asset('assets/image/'),
                //Image.asset('assets/image/'),
                ElevatedButton(onPressed: btnTaped, child: Text('Roll!'))
              ],
            ),
          ),
        ));
  }
}
