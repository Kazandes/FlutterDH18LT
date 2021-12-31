import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String light = 'GREEN';
  String instruction = 'GO';
  Color? instructionColor = Colors.green[500];
  String walklight = 'GREEN';

  int _counter = 0;
  late Timer _timer;

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          setState(() {
            timer.cancel();
            changeLight();
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    light = 'GREEN';
    instruction = 'GO';
    instructionColor = Colors.green[500];
    super.initState();
  }

  void changeLight() {
    setState(() {
      if (light == 'GREEN') {
        light = 'YELLOW';
        instruction = 'SLOW';
        instructionColor = Colors.orange[500];
        _counter = 3;
        walklight = 'RED';
        _startTimer();
      } else if (light == 'YELLOW') {
        light = 'RED';
        instruction = 'STOP';
        instructionColor = Colors.red[500];
        _counter = 15;
        walklight = 'GREEN';
        _startTimer();
      } else {
        light = 'GREEN';
        instruction = 'GO';
        instructionColor = Colors.green[500];
        _counter = 30;
        walklight = 'RED';
        _startTimer();
      }
    });
  }

  int turnOnLight(String lightactive) {
    int num = 100;
    if (light == lightactive) {
      num = 500;
    }
    return num;
  }

  int turnOnWalklight(String walklightactive) {
    int num = 100;
    if (walklight == walklightactive) {
      num = 500;
    }
    return num;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Traffic Light'),
          backgroundColor: Colors.teal[300],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                instruction,
                style: TextStyle(
                  fontSize: 32,
                  color: instructionColor,
                ),
              ),
              Text(
                _counter.toString(),
                style: TextStyle(fontSize: 32, color: instructionColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.green[turnOnLight('GREEN')],
                  ),
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.yellow[turnOnLight('YELLOW')],
                  ),
                  Icon(
                    Icons.circle,
                    size: 100,
                    color: Colors.red[turnOnLight('RED')],
                  ),
                ],
              ),
              Icon(
                Icons.directions_walk,
                size: 100,
                color: Colors.red[turnOnWalklight('RED')],
              ),
              Icon(
                Icons.directions_walk,
                size: 100,
                color: Colors.green[turnOnWalklight('GREEN')],
              ),
              ElevatedButton(
                onPressed: changeLight,
                child: Text(
                  'Turn On',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
