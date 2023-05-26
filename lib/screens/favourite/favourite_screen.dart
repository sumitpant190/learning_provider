import 'package:flutter/material.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:learning_provider/screens/favourite/my_items.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  //List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
      ),
      body: Column(children: [
        Consumer<FavouriteProvider>(
          builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItems(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text('Item' + index.toString()),
                      trailing: Icon(value.selectedItems.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  }),
            );
          },
        )
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyItems()));
      }),
    );
  }
}
