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
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: const Text(
              'Click Me',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: AnimatedPhysicalModel(
                elevation: isPressed ? 20 : 0,
                shape: BoxShape.rectangle,
                shadowColor: Colors.black,
                color: Colors.white,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Icon(
                        Icons.flutter_dash,
                        color: Colors.blue,
                        size: constraints.biggest.height,
                      );
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
