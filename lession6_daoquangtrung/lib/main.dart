import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  final AudioCache audioCache = AudioCache();
  // This widget is the root of your application.

  void btnDOTaped() {
    audioCache.play('audio/noteDO.wav');
  }

  void btnFATaped() {
    audioCache.play('audio/noteFA.wav');
  }

  void btnLATaped() {
    audioCache.play('audio/noteLA.wav');
  }

  void btnMITaped() {
    audioCache.play('audio/noteMI.wav');
  }

  void btnRETaped() {
    audioCache.play('audio/noteRE.wav');
  }

  void btnSITaped() {
    audioCache.play('audio/noteSI.wav');
  }

  void btnSOLTaped() {
    audioCache.play('audio/noteSOL.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Xylophone',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Xylophone'),
              backgroundColor: Colors.teal[300],
            ),
            body: Center(
                child: Column(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 1000,
                      minHeight: 100,
                      minWidth: 500,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnDOTaped(),
                        child: Text('DO'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(800, 400),
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 900,
                      minHeight: 100,
                      minWidth: 450,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnRETaped(),
                        child: Text('RE'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(700, 400),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 800,
                      minHeight: 100,
                      minWidth: 400,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnMITaped(),
                        child: Text('MI'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(600, 400),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 700,
                      minHeight: 100,
                      minWidth: 350,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnFATaped(),
                        child: Text('FA'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(500, 400),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 600,
                      minHeight: 100,
                      minWidth: 300,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnSOLTaped(),
                        child: Text('SOL'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(400, 400),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 500,
                      minHeight: 100,
                      minWidth: 250,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnLATaped(),
                        child: Text('LA'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(300, 400),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                      maxWidth: 400,
                      minHeight: 100,
                      minWidth: 200,
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ElevatedButton(
                        onPressed: () => btnSITaped(),
                        child: Text('SI'),
                        style: TextButton.styleFrom(
                          maximumSize: Size(200, 400),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))));
  }
}
