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
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double radiusValue = 1;

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
            value: radiusValue,
            min: 1,
            max: 10,
            onChanged: (double value) {
              setState(() => radiusValue = value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return RadialGradient(
                center: Alignment.bottomRight,
                radius: radiusValue,
                colors: const <Color>[
                  Colors.yellow,
                  Colors.deepOrangeAccent,
                  Colors.deepPurpleAccent,
                  Colors.blueAccent,
                  Colors.greenAccent,
                  Colors.redAccent,
                ],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: const FlutterLogo(
              size: 500,
            ),
          ),
        ],
      ),
    );
  }
}
