import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  Color buttonColor;
  CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;

  void increment() {
    if (mounted) {
      setState(() {
        counter++;
      });
    }
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        onPressed: () {
          increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          "$counter",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
