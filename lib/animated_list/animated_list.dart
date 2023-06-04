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
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key? key}) : super(key: key);

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final listItems = [];
  final List<IconData> iconData = <IconData>[
    Icons.local_airport,
    Icons.local_dining,
    Icons.local_drink,
    Icons.local_florist,
    Icons.local_gas_station,
    Icons.local_grocery_store,
    Icons.local_atm,
    Icons.local_cafe,
  ];

// A helper method to build a list item
  Widget _buildListItem() {
    final Random random = Random();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.primaries[random.nextInt(Colors.primaries.length)],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData[random.nextInt(iconData.length)],
              size: 30,
            ),
            const Text(
              'A list item',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void insertItem() {
    listItems.insert(0, _buildListItem());
    listKey.currentState!.insertItem(0);
  }

  void removeItem() {
    final removedItem = listItems.removeAt(0);
    listKey.currentState!.removeItem(
      0,
      (context, animation) {
        return SizeTransition(
          key: UniqueKey(),
          sizeFactor: animation,
          child: removedItem,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => insertItem(),
                icon: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.green,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => removeItem(),
                icon: const Icon(
                  Icons.remove,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: AnimatedList(
              key: listKey,
              initialItemCount: listItems.length,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  key: UniqueKey(),
                  opacity: animation,
                  child: listItems[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
