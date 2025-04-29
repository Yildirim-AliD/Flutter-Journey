import 'package:flutter/material.dart';

class SayacWidget extends StatefulWidget {
  const SayacWidget({super.key});

  @override
  State<SayacWidget> createState() => SayacWidgetState();
}

class SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;

  void arttir() {
    setState(() {
      _sayac++;
    });
  }

  void azalt() {
    setState(() {
      _sayac--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
