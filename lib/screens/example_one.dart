import 'package:flutter/material.dart';
import 'package:learning_provider/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
//  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    print('tree rebuild');

    return Scaffold(
      appBar: AppBar(title: Text('Subscribe')),
      body: Consumer<ExampleOneProvider>(
        builder: (context, value, child) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Slider(
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                }),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green.withOpacity(value.value),
                    child: Text('Container 1'),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(value.value),
                    child: Text('Container 1'),
                  ),
                ),
              ],
            )
          ]);
        },
      ),
    );
  }
}
