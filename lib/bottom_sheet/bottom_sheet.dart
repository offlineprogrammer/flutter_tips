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
        child: const Text('Show Bottom Sheet'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 300,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Close',
                              style: TextStyle(fontSize: 20),
                            )),
                        const FlutterLogo(
                          size: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                );
              });
        },
      ),
    );
  }
}
