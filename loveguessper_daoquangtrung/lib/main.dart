import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Form'),
          backgroundColor: Colors.teal[300],
        ),
        body: DemoTextField(),
      ),
    );
  }
}

class DemoSwitch extends StatefulWidget {
  const DemoSwitch({Key? key}) : super(key: key);

  @override
  _DemoSwitchState createState() => _DemoSwitchState();
}

class _DemoSwitchState extends State<DemoSwitch> {
  bool _isOn = false;
  bool _isOnSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            title: Text(
              'Option',
              style: TextStyle(fontSize: 30),
            ),
            value: _isOn,
            onChanged: (bool? value) {
              setState(() {
                _isOn = value!;
              });
            },
          ),
          Text(
            'Switch is turn on: $_isOn',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isOnSubmit = _isOn;
              });
            },
            child: Text(
              'Submit Switch',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Text(
            _isOnSubmit ? 'Turned On' : 'Turn Off',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

class DemoTextField extends StatefulWidget {
  const DemoTextField({Key? key}) : super(key: key);

  @override
  _DemoTextFieldState createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField> {
  late TextEditingController _textControllername1;
  late TextEditingController _textControllername2;
  String _textname1 = 'Hello';
  String _textname2 = 'Hello';
  String _textSubmit = 'Hi';

  @override
  void initState() {
    super.initState();
    _textControllername1 = TextEditingController();
    _textControllername2 = TextEditingController();
  }

  @override
  void dispose() {
    _textControllername1.dispose();
    _textControllername2.dispose();
    super.dispose();
  }

  String getResult(String Sum) {
    String Sumchar = '';
    int firstnum = int.parse(Sum[0]);
    for (int i = 1; i < Sum.length; i++) {
      Sumchar = Sumchar + (int.parse(Sum[0]) + int.parse(Sum[i])).toString();
    }
    return Sumchar;
  }

  String loveGuessper(String name1, String name2) {
    String result = 'Hello';
    int countL = 1;
    int countO = 1;
    int countV = 1;
    int countE = 1;
    int countS = 1;
    int i = 0;

    name1 = name1.toUpperCase();
    name2 = name2.toLowerCase();

    for (i = 0; i < name1.length; i++) {
      if ((name1[i] == 'L')) {
        countL++;
      } else {
        if ((name1[i] == 'O')) {
          countO++;
        } else {
          if ((name1[i] == 'V')) {
            countV++;
          } else {
            if ((name1[i] == 'E')) {
              countE++;
            } else {
              if ((name1[i] == 'S')) {
                countS++;
              }
            }
          }
        }
      }
    }

    for (i = 0; i < name2.length; i++) {
      if ((name2[i] == 'L')) {
        countL++;
      } else {
        if ((name2[i] == 'O')) {
          countO++;
        } else {
          if ((name2[i] == 'V')) {
            countV++;
          } else {
            if ((name2[i] == 'E')) {
              countE++;
            } else {
              if ((name2[i] == 'S')) {
                countS++;
              }
            }
          }
        }
      }
    }

    String Sum = countL.toString() +
        countO.toString() +
        countV.toString() +
        countE.toString() +
        countS.toString();
    while (int.parse(Sum) > 100) {
      Sum = getResult(Sum);
    }

    if (int.parse(Sum) < 50) {
      result = 'Hai người không quá hòa hợp với nhau.';
    } else {
      if (int.parse(Sum) < 80) {
        result = 'Sự phù hợp giữa hai người ở mức tương đối.';
      } else {
        if (int.parse(Sum) <= 100) {
          result =
              'Đây là cặp đôi thanh mai trúc mã, đi từ tình bạn trong sáng ngây thơ.';
        } else {
          result = 'Lỗi';
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textControllername1,
            style: TextStyle(fontSize: 30),
            onChanged: (text) {
              setState(() {
                _textname1 = text;
              });
            },
          ),
          TextField(
            controller: _textControllername2,
            style: TextStyle(fontSize: 30),
            onChanged: (text) {
              setState(() {
                _textname2 = text;
              });
            },
          ),
          Text(
            '$_textname1',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'LOVES',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            '$_textname2',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _textSubmit = loveGuessper(_textname1, _textname2);
              });
            },
            child: Text(
              'Submit Text',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text('$_textSubmit', style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
