import 'package:flutter/material.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyItems extends StatelessWidget {
  const MyItems({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('My Items')),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {},
                      title: Text('Item' + index.toString()),
                      trailing: Icon(Icons.favorite));
                }))
      ]),
    );
  }
}
