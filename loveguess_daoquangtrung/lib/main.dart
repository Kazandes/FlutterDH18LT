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

  int getResult(int Sum) {
    int Sumchar = 0;
    String SumString = Sum.toString();
    for (int i = 0; i < SumString.length; i++) {
      Sumchar += int.parse(SumString[i]);
    }

    return Sumchar;
  }

  String loveGuess(String name1, String name2) {
    String result = 'Hello';
    int i = 0, namenum1 = 0, namenum2 = 0;

    name1 = name1.toUpperCase();
    name2 = name2.toUpperCase();

    for (i = 0; i < name1.length; i++) {
      if ((name1[i] == 'A') || (name1[i] == 'K') || (name1[i] == 'U')) {
        namenum1 += 1;
      } else {
        if ((name1[i] == 'B') || (name1[i] == 'S') || (name1[i] == 'J')) {
          namenum1 += 2;
        } else {
          if ((name1[i] == 'C') || (name1[i] == 'L') || (name1[i] == 'T')) {
            namenum1 += 3;
          } else {
            if ((name1[i] == 'D') || (name1[i] == 'N') || (name1[i] == 'X')) {
              namenum1 += 4;
            } else {
              if ((name1[i] == 'E') || (name1[i] == 'M') || (name1[i] == 'W')) {
                namenum1 += 5;
              } else {
                if ((name1[i] == 'F') ||
                    (name1[i] == 'O') ||
                    (name1[i] == 'V')) {
                  namenum1 += 6;
                } else {
                  if ((name1[i] == 'G') ||
                      (name1[i] == 'Q') ||
                      (name1[i] == 'Z')) {
                    namenum1 += 7;
                  } else {
                    if ((name1[i] == 'H') ||
                        (name1[i] == 'P') ||
                        (name1[i] == 'Y')) {
                      namenum1 += 8;
                    } else {
                      if ((name1[i] == 'I') || (name1[i] == 'R')) {
                        namenum1 += 9;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    for (i = 0; i < name2.length; i++) {
      if ((name2[i] == 'A') || (name2[i] == 'K') || (name2[i] == 'U')) {
        namenum1 += 1;
      } else {
        if ((name2[i] == 'B') || (name2[i] == 'S') || (name2[i] == 'J')) {
          namenum1 += 2;
        } else {
          if ((name2[i] == 'C') || (name2[i] == 'L') || (name2[i] == 'T')) {
            namenum1 += 3;
          } else {
            if ((name2[i] == 'D') || (name2[i] == 'N') || (name2[i] == 'X')) {
              namenum1 += 4;
            } else {
              if ((name2[i] == 'E') || (name2[i] == 'M') || (name2[i] == 'W')) {
                namenum1 += 5;
              } else {
                if ((name2[i] == 'F') ||
                    (name2[i] == 'O') ||
                    (name2[i] == 'V')) {
                  namenum1 += 6;
                } else {
                  if ((name2[i] == 'G') ||
                      (name2[i] == 'Q') ||
                      (name2[i] == 'Z')) {
                    namenum1 += 7;
                  } else {
                    if ((name2[i] == 'H') ||
                        (name2[i] == 'P') ||
                        (name2[i] == 'Y')) {
                      namenum1 += 8;
                    } else {
                      if ((name2[i] == 'I') || (name2[i] == 'R')) {
                        namenum1 += 9;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    int Sum = namenum1 + namenum2;
    while (Sum > 9) {
      Sum = getResult(Sum);
    }

    if (Sum == 1) {
      result = 'Hai ng?????i ch??nh l?? nh???ng ng?????i b???n ?????i tri k??? c???a nhau.';
    } else {
      if (Sum == 2) {
        result =
            'M???i t??nh c???a hai ng?????i d?? th???m thi???t nh??ng s??? g???p ph???i tr??? ng???i.';
      } else {
        if (Sum == 3) {
          result =
              '????y l?? c???p ????i thanh mai tr??c m??, ??i t??? t??nh b???n trong s??ng ng??y th??.';
        } else {
          if (Sum == 4) {
            result = 'M???i l????ng duy??n ti???n ?????nh k??o d??i trong nhi???u ki???p.';
          } else {
            if (Sum == 5) {
              result =
                  'M???i t??nh c???a hai ng?????i c?? nguy c?? tan v??? b???i s??? chen ngang.';
            } else {
              if (Sum == 6) {
                result =
                    'Ngay t??? c??i nh??n ?????u ti??n, hai ng?????i ???? x??c ?????nh ?????i ph????ng...';
              } else {
                if (Sum == 7) {
                  result =
                      'Hai ng?????i ?????n v???i nhau v?? s??? h??a h???p v??? ch?? h?????ng v?? l?? t?????ng.';
                } else {
                  if (Sum == 8) {
                    result = 'M???c ????? ??n ?? c???a hai ng?????i ??? m???c kh?? cao.';
                  } else {
                    if (Sum == 9) {
                      result = 'T??m h???n c???a hai ng?????i kh??ng h?????ng v??? nhau';
                    } else {
                      result = 'L???i';
                    }
                  }
                }
              }
            }
          }
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
            'Hello $_textname1',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Hello $_textname2',
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _textSubmit = loveGuess(_textname1, _textname2);
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
