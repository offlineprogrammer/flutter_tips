import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.dark(),
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
  double radius = 100;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Slider(
            value: radius,
            min: 100,
            max: 175,
            onChanged: (double value) {
              setState(() => radius = value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: radius,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Icon(
                  Icons.flutter_dash,
                  size: constraints.biggest.height,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
