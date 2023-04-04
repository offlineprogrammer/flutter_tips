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
    with TickerProviderStateMixin {
  late AnimationController myAnimation;
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        color: const Color(0xFF000000),
        style: BorderStyle.solid,
        width: 4.0,
      ),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66000000),
          blurRadius: 10.0,
          spreadRadius: 4.0,
        )
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFF000000),
      border: Border.all(
        color: const Color(0xFF202020),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle,
      // No shadow.
    ),
  );

  @override
  void initState() {
    super.initState();

    myAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    myAnimation.dispose();
    super.dispose();
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
              } else {
                myAnimation.forward();
              }
            },
            child: DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: decorationTween.animate(myAnimation),
              child: Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20),
                child: const FlutterLogo(),
              ),
            ),
          ),
        );
      },
    );
  }
}
