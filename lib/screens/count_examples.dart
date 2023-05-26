import 'package:flutter/material.dart';
import 'package:learning_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExamples extends StatefulWidget {
  const CountExamples({super.key});

  @override
  State<CountExamples> createState() => _CountExamplesState();
}

class _CountExamplesState extends State<CountExamples> {
  //int count = 0;

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('tree build');
    return Scaffold(
        appBar: AppBar(
          title: Text('Count Example'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              //rebuilding widget only using provider
              print('widget only');
              return Text(
                value.count.toString(),
                style: TextStyle(fontSize: 50),
              );
            },
          )),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: Icon(Icons.add),
        ));
  }
}
