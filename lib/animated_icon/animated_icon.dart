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

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController myAnimation;
  Color iconColor = Colors.redAccent;

  @override
  void initState() {
    super.initState();

    myAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Center(
          child: InkWell(
            onTap: () {
              if (myAnimation.isCompleted) {
                myAnimation.reverse();
                setState(() {
                  iconColor = Colors.redAccent;
                });
              } else {
                myAnimation.forward();
                setState(() {
                  iconColor = Colors.green;
                });
              }
            },
            child: AnimatedIcon(
              color: iconColor,
              icon: AnimatedIcons.pause_play,
              size: constraint.biggest.width,
              progress: myAnimation,
            ),
          ),
        );
      },
    );
  }
}
