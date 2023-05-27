import 'package:flutter/material.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:learning_provider/provider/example_one_provider.dart';
import 'package:learning_provider/provider/favourite_provider.dart';
import 'package:learning_provider/provider/theme_changer_provider.dart';
import 'package:learning_provider/screens/count_examples.dart';
import 'package:learning_provider/screens/dark_theme.dart';
import 'package:learning_provider/screens/example_one.dart';
import 'package:learning_provider/screens/favourite/favourite_screen.dart';
import 'package:learning_provider/screens/notify_listeners_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChanger>(context);
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
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(),
          ),
        ],
        child: Builder(builder: (context) {
          final themeChanger = Provider.of<ThemeChanger>(context);

          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: NotifyListenersScreen(),
          );
        }));
  }
}
