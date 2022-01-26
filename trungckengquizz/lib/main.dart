import 'dart:async';
import 'dart:js';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quiver/async.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'English Quizz',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstSceen(),
      },
    ),
  );
}

class Level {
  final String data;

  const Level(this.data);
}

class Result {
  final String level;
  final int Total;

  const Result(this.level, this.Total);
}

class FirstSceen extends StatelessWidget {
  const FirstSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'English Quizz',
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Center(
                child: Column(
              children: [
                Container(
                  width: 200.w,
                  height: 100.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  color: Colors.purple,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: null,
                      child: const Text('English Quizz'),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      'Choose quizz level: ',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 80.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  //color: Colors.green[500],
                  child: Center(
                    child: ElevatedButton(
                      child: Text(
                        'Easy',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[500],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondSceen(
                                level: Level('E'),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 80.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  //color: Colors.orange[500],
                  child: Center(
                    child: ElevatedButton(
                      child: Text(
                        'Medium',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[500],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondSceen(
                                level: Level('M'),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 80.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  //color: Colors.red[500],
                  child: Center(
                    child: ElevatedButton(
                      child: Text(
                        'Hard',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[500],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondSceen(
                                level: Level('H'),
                              ),
                            ));
                      },
                    ),
                  ),
                ),
              ],
            )),
          );
        },
        theme: ThemeData(
          textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
      ),
    );
  }
}

class SecondSceen extends StatelessWidget {
  final Level level;

  SecondSceen({
    Key? key,
    required this.level,
  }) : super(key: key);

  String LevelName = '';
  String LevelTime = '';
  String LevelPlus = '';
  String LevelMinus = '';

  setLevel() {
    LevelName = CheckLevelName(level.data);
    LevelTime = CheckLevelTime(level.data);
    LevelPlus = CheckLevelPlus(level.data);
    LevelMinus = CheckLevelMinus(level.data);
  }

  String CheckLevelName(String level) {
    String LevelName;
    if (level.toString() == 'E') {
      LevelName = 'Easy';
    } else if (level.toString() == 'M') {
      LevelName = 'Medium';
    } else {
      LevelName = 'Hard';
    }
    return LevelName;
  }

  String CheckLevelTime(String level) {
    String TimeLevel;
    if (level.toString() == 'E') {
      TimeLevel = '30';
    } else if (level.toString() == 'M') {
      TimeLevel = '20';
    } else {
      TimeLevel = '10';
    }
    return TimeLevel;
  }

  String CheckLevelPlus(String level) {
    String Plus;
    if (level.toString() == 'E') {
      Plus = '10';
    } else if (level.toString() == 'M') {
      Plus = '20';
    } else {
      Plus = '30';
    }
    return Plus;
  }

  String CheckLevelMinus(String level) {
    String Minus;
    if (level.toString() == 'E') {
      Minus = '5';
    } else if (level.toString() == 'M') {
      Minus = '10';
    } else {
      Minus = '15';
    }
    return Minus;
  }

  @override
  Widget build(BuildContext context) {
    setLevel();

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'English Quizz',
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Center(
                child: Column(
              children: [
                Container(
                  width: 200.w,
                  height: 100.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: null,
                      child: const Text('Quizz Info'),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    'Level: $LevelName',
                    style: TextStyle(fontSize: 10.sp, color: Colors.black),
                  )),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    'Total Question: 10',
                    style: TextStyle(fontSize: 10.sp, color: Colors.black),
                  )),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    'Total Time: $LevelTime',
                    style: TextStyle(fontSize: 10.sp, color: Colors.black),
                  )),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    'Right Answer: + $LevelPlus',
                    style: TextStyle(fontSize: 10.sp, color: Colors.black),
                  )),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                      child: Text(
                    'Wrong Answer: - $LevelMinus',
                    style: TextStyle(fontSize: 10.sp, color: Colors.black),
                  )),
                ),
                Container(
                  width: 200.w,
                  height: 80.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: ElevatedButton(
                      child: Text(
                        'Start Quizz',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[500],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdSceen(
                                gameLevel: level,
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 80.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: ElevatedButton(
                      child: Text(
                        'Back',
                        style: TextStyle(fontSize: 20.sp, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[500],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> routes) => false);
                      },
                    ),
                  ),
                ),
              ],
            )),
          );
        },
        theme: ThemeData(
          textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
      ),
    );
  }
}

class ThirdSceen extends StatefulWidget {
  final Level gameLevel;
  const ThirdSceen({Key? key, required this.gameLevel}) : super(key: key);

  @override
  _ThirdSceenState createState() => _ThirdSceenState(gameStateLevel: gameLevel);
}

class _ThirdSceenState extends State<ThirdSceen> {
  Level gameStateLevel;

  _ThirdSceenState({required this.gameStateLevel});

  dynamic listImagesnotFound = [
    "assets/img/cow.png",
    "assets/img/deer.png",
    "assets/img/dog.png",
    "assets/img/lion.png",
    "assets/img/monkey.png",
    "assets/img/squirrel.png",
  ];

  dynamic listAnswers = [
    "Cow",
    "Deer",
    "Dog",
    "Lion",
    "Monkey",
    "Squirrel",
  ];

  int LevelTime = 0;
  int LevelTimeCurrent = 0;
  int LevelPlus = 0;
  int LevelMinus = 0;
  int Total = 0;
  int QuesNum = 0;
  String QuesNumString = '1';
  String level = '';
  int _start = 0;
  String timerShow = '';
  int max = 5;
  int count = 0;

  int _counter = 0;
  late Timer _timer;

  LoadOneTime() {
    if (count == 0) {
      setLevel(gameStateLevel);
      _counter = LevelTime;
      _startTimer();
      count = 1;
    }
  }

  GuessAnimals(int rightAnswer) {
    if (rightAnswer == QuesNum) {
      Total += LevelPlus;
      NextQuestion();
    } else {
      Total -= LevelMinus;
      NextQuestion();
    }
  }

  Image img() {
    String image_name = listImagesnotFound[QuesNum].toString();
    return Image.asset(
      image_name,
      fit: BoxFit.contain,
    );
  }

  String RightAnswer() {
    return listAnswers[QuesNum].toString();
  }

  String WrongAnswer() {
    return listAnswers[GetRandomAnswer()].toString();
  }

  void NextQuestion() {
    QuesNum += 1;
    if (QuesNum > max) {
      QuesNum = 0;
    } else {
      QuesNumString = (QuesNum + 1).toString();
    }
  }

  int GetRandomAnswer() {
    int rdn = QuesNum;
    var numberrandom = new Random();
    while (rdn == QuesNum) {
      rdn = numberrandom.nextInt(5);
      while ((rdn > 5) || (rdn < 0)) {
        rdn = numberrandom.nextInt(5);
      }
    }
    return rdn;
  }

  _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          setState(() {
            timer.cancel();
            dispose();
          });
        } else {
          setState(() {
            _counter--;
            timerShow = _counter.toString();
          });
        }
      },
    );
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void setLevel(Level StategameLevel) {
    LevelTime = CheckLevelTime(StategameLevel.data);
    LevelTimeCurrent = CheckLevelTime(StategameLevel.data);
    LevelPlus = CheckLevelPlus(StategameLevel.data);
    LevelMinus = CheckLevelMinus(StategameLevel.data);
    level = StategameLevel.data;
  }

  int CheckLevelTime(String level) {
    int TimeLevel;
    if (level.toString() == 'E') {
      TimeLevel = 30;
    } else if (level.toString() == 'M') {
      TimeLevel = 20;
    } else {
      TimeLevel = 10;
    }
    return TimeLevel;
  }

  int CheckLevelPlus(String level) {
    int Plus;
    if (level.toString() == 'E') {
      Plus = 10;
    } else if (level.toString() == 'M') {
      Plus = 20;
    } else {
      Plus = 30;
    }
    return Plus;
  }

  int CheckLevelMinus(String level) {
    int Minus;
    if (level.toString() == 'E') {
      Minus = 5;
    } else if (level.toString() == 'M') {
      Minus = 10;
    } else {
      Minus = 15;
    }
    return Minus;
  }

  @override
  Widget build(BuildContext context) {
    LoadOneTime();
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'English Quizz',
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Center(
                child: Column(
              children: [
                Container(
                  width: 200.w,
                  height: 80.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      'Quizz Time: $timerShow',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(children: [
                    Container(
                      width: 100.w,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          'Question: $QuesNumString / 10',
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          'Score: $Total',
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: 200.w,
                  height: 200.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: img(),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: Colors.green,
                  child: Center(
                    child: TextButton(
                      onPressed: GuessAnimals((QuesNum)),
                      child: Text(
                        RightAnswer(),
                        style: TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: Colors.green,
                  child: Center(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        WrongAnswer(),
                        style: TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: Colors.green,
                  child: Center(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        WrongAnswer(),
                        style: TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: Colors.green,
                  child: Center(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        WrongAnswer(),
                        style: TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  //color: Colors.red,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FourthSceen(
                                  resultScreen: Result(level, Total))),
                        );
                      },
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                        primary: Colors.red[500],
                      ),
                      child: Text('Show Result',
                          style: TextStyle(fontSize: 10, color: Colors.black)),
                    ),
                  ),
                ),
              ],
            )),
          );
        },
        theme: ThemeData(
          textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
      ),
    );
  }
}

class FourthSceen extends StatefulWidget {
  final Result resultScreen;
  FourthSceen({Key? key, required this.resultScreen}) : super(key: key);

  _FourthSceenState createState() =>
      _FourthSceenState(resultScreen: resultScreen);
}

class _FourthSceenState extends State<FourthSceen> {
  late Result resultScreen;

  _FourthSceenState({required this.resultScreen});

  int Total = 0;
  int EasyHigh = 0;
  int MediumHigh = 0;
  int HardHigh = 0;
  String level = '';
  int count = 0;

  void setLevel(Result resultScreen) {
    level = CheckLevelName(resultScreen.level);
    Total = resultScreen.Total;
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      EasyHigh = (prefs.getInt('easyhigh') ?? 0);
      MediumHigh = (prefs.getInt('mediumhigh') ?? 0);
      HardHigh = (prefs.getInt('hardhigh') ?? 0);
    });
  }

  void _incrementData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (resultScreen.level.toString() == 'E') {
        if (Total > (prefs.getInt('easyhigh') ?? 0)) {
          prefs.setInt('easyhigh', Total);
        }
      } else {
        if (resultScreen.level.toString() == 'M') {
          if (Total > (prefs.getInt('mediumhigh') ?? 0)) {
            prefs.setInt('mediumhigh', Total);
          }
        } else {
          if (resultScreen.level.toString() == 'H') {
            if (Total > (prefs.getInt('hardhigh') ?? 0)) {
              prefs.setInt('hardhigh', Total);
            }
          }
        }
      }
    });
  }

  CheckHighScore(int Total) {
    int HighScore;
    if (level.toString() == 'E') {
      //LevelName = 'Easy';
    } else if (level.toString() == 'M') {
      //LevelName = 'Medium';
    } else {
      //LevelName = 'Hard';
    }
  }

  String CheckLevelName(String level) {
    String LevelName;
    if (level.toString() == 'E') {
      LevelName = 'Easy';
    } else if (level.toString() == 'M') {
      LevelName = 'Medium';
    } else {
      LevelName = 'Hard';
    }
    return LevelName;
  }

  LoadOneTime() {
    if (count == 0) {
      setLevel(resultScreen);
      _incrementData();
      _loadData();
      count = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    LoadOneTime();
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'English Quizz',
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Center(
                child: Column(
              children: [
                Container(
                  width: 200.w,
                  height: 100.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: null,
                      child: const Text('Your Quizz'),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 100.h,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(children: [
                    Container(
                      width: 100.w,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          'Level: $level',
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 50.h,
                      child: Center(
                        child: Text(
                          'Score: $Total',
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  width: 200.w,
                  height: 100.h,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 25.sp),
                        backgroundColor: Colors.purple,
                      ),
                      onPressed: null,
                      child: const Text('High Score: '),
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 50.h,
                  child: Center(
                    child: Text(
                      'Easy: $EasyHigh',
                      style: TextStyle(fontSize: 10.sp, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 50.h,
                  child: Center(
                    child: Text(
                      'Medium: $MediumHigh',
                      style: TextStyle(fontSize: 10.sp, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 100.w,
                  height: 50.h,
                  child: Center(
                    child: Text(
                      'Hard: $HardHigh',
                      style: TextStyle(fontSize: 10.sp, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 50.h,
                  margin: const EdgeInsets.only(bottom: 5),
                  //color: Colors.red,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/', (Route<dynamic> route) => false);
                      },
                      style: TextButton.styleFrom(
                        textStyle:
                            TextStyle(fontSize: 25.sp, color: Colors.black),
                        primary: Colors.red[500],
                      ),
                      child: Text('Restart Quizz',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
