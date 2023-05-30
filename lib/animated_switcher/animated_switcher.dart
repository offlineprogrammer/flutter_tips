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
  int selectedWidget = 1;

  static Widget selectWidget(int selectedWidget) {
    return selectedWidget == 1 ? buildFlutterLogo() : buildDashIcon();
  }

  static Widget buildFlutterLogo() {
    return const FlutterLogo(
      size: 300,
    );
  }

  static Widget buildDashIcon() {
    return const Icon(
      Icons.flutter_dash,
      size: 300,
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedWidget = selectedWidget == 1 ? 2 : 1;
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
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: selectWidget(selectedWidget),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            },
          )
        ],
      ),
    );
  }
}
