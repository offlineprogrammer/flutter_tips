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
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('About Me'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const AboutDialog(
                    applicationName: 'About Me',
                    applicationVersion: '1.0.0',
                    applicationIcon: FlutterLogo(),
                    children: [
                      Text('This is a Flutter Tips App'),
                    ],
                  ));
        },
      ),
    );
  }
}
