import 'package:flutter/material.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:learning_provider/provider/example_one_provider.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:learning_provider/screens/count_examples.dart';
import 'package:learning_provider/screens/example_one.dart';
import 'package:learning_provider/screens/favourite/favourite_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FavouriteScreen(),
        ));
  }
}
