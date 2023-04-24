import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Color _color = Colors.blue;
  double _fontSize = 20.0;
  Random _random = Random();

  void randomTextStyle() {
    setState(() {
      _color = Colors.primaries[_random.nextInt(Colors.primaries.length)];
      _fontSize = _random.nextDouble() * 30 + 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: InkWell(
          onTap: randomTextStyle,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: TextStyle(
              color: _color,
              fontSize: _fontSize,
              fontWeight: FontWeight.bold,
            ),
            child: const Text(
              'Flutter ',
            ),
          ),
        ),
      ),
    );
  }
}
