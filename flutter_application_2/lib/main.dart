//import 'package:flutter_application_2/button.dart';
import 'package:flutter_application_2/dropdown_popup.dart';
import 'package:flutter_application_2/image_widge.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(ButtonApp());
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, useMaterial3: false),
      home: DropdownPopup(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _count = 0;

  void _addCount() {
    setState(() {
      _count++;
    });
  }

  void _lowerCounter() {
    setState(() {
      _count--;
    });
  }

  void _zero() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yıldırım")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Butona basılma sayısı:",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              _count.toString(),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color:
                    _count < 0
                        ? Colors.red
                        : _count > 0
                        ? Colors.green
                        : Colors.black,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _addCount();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () {
              _lowerCounter();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () {
              _zero();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
