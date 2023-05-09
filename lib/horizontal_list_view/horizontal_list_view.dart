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
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key? key}) : super(key: key);

  // A helper method to build a list item
  static Widget _buildListItem(String title, Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(2),
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // The items to be displayed in ListView
  final List<Widget> items = [
    _buildListItem('Airport', Colors.pink, Icons.local_airport),
    _buildListItem('Dining', Colors.green, Icons.local_dining),
    _buildListItem('Drink', Colors.deepPurple, Icons.local_drink),
    _buildListItem('Florist', Colors.amber, Icons.local_florist),
    _buildListItem('Gas', Colors.teal, Icons.local_gas_station),
    _buildListItem('Grocery', Colors.indigo, Icons.local_grocery_store),
    _buildListItem('ATM', Colors.cyan, Icons.local_atm),
    _buildListItem('Coffee', Colors.lime, Icons.local_cafe),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: items,
        ),
      ),
    );
  }
}
