import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  double _width = 100;
  double _height = 100;
  Color _color = Colors.yellow;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void _changeContainer() {
    final random = Random();
    setState(() {
      _width = random.nextInt(500).toDouble();
      _height = random.nextInt(500).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(300),
        random.nextInt(300),
        random.nextInt(300),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: _changeContainer,
            child: const Text(
              'Click Me',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ],
      ),
    );
  }
}
