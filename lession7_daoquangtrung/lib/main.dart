import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Interactivity',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Interactivity'),
          backgroundColor: Colors.teal[300],
        ),
        body: const DemoIconButton(),
      ),
    );
  }
}

class DemoElevatedButton extends StatefulWidget {
  const DemoElevatedButton({Key? key}) : super(key: key);

  @override
  _DemoElevatedButtonState createState() => _DemoElevatedButtonState();
}

class DemoTextButton extends StatefulWidget {
  const DemoTextButton({Key? key}) : super(key: key);

  @override
  _DemoTextButtonState createState() => _DemoTextButtonState();
}

class DemoIconButton extends StatefulWidget {
  const DemoIconButton({Key? key}) : super(key: key);

  @override
  _DemoIconButtonState createState() => _DemoIconButtonState();
}

class _DemoIconButtonState extends State<DemoIconButton> {
  double _volume = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.volume_down,
                  size: 50,
                ),
                tooltip: 'Decrease volume by 10',
                onPressed: () {
                  setState(() {
                    _volume -= 10;
                  });
                },
              ),
              Ink(
                width: 70,
                height: 70,
                decoration: const ShapeDecoration(
                  color: Colors.teal,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    size: 50,
                  ),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    setState(() {
                      _volume += 10;
                    });
                  },
                ),
              ),
            ],
          ),
          Text(
            'Volume : $_volume',
            style: TextStyle(
              fontSize: 30,
              color: Colors.teal[500],
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoTextButtonState extends State<DemoTextButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
            ),
            onPressed: null,
            child: const Text('Disabled'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
            ),
            onPressed: () {},
            child: const Text('Enabled'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color(0xFF14B8A6),
                      Color(0xFF5eead4),
                      Color(0xFFccfbf1),
                    ])),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  onPressed: () {},
                  child: const Text('Gradient'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DemoElevatedButtonState extends State<DemoElevatedButton> {
  String _text = 'Change me!';

  void update() {
    setState(() {
      _text = 'Button Tapped';
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 30,
      ),
      primary: Colors.teal[500],
    );
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          _text,
          style: TextStyle(fontSize: 50),
        ),
        ElevatedButton(
          style: _buttonStyle,
          onPressed: null,
          child: Text('Disabled'),
        ),
        ElevatedButton(
          style: _buttonStyle,
          onPressed: () => update(),
          child: Text('Enabled'),
        ),
      ]),
    );
  }
}
