import 'package:flutter/material.dart';

class NotifyListenersScreen extends StatelessWidget {
  NotifyListenersScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('Hello')),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (context, value, child) {
            return Text(_counter.value.toString(),
                style: TextStyle(fontSize: 50));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _counter.value++;
      }),
    );
  }
}
