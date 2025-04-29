import 'package:flutter/material.dart';
import 'package:input_widget/sayac_widget.dart';

class GlobalKeyAnlatimi extends StatelessWidget {
  GlobalKeyAnlatimi({super.key});

  final _sayacWidgetKey = GlobalKey<SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Butona basılma miktari'),
          Text('${DateTime.now()}'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'asdasd',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          SayacWidget(key: _sayacWidgetKey),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  _sayacWidgetKey.currentState!.arttir();
                },
                child: const Text('Arttır'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  _sayacWidgetKey.currentState!.azalt();
                },
                child: const Text('Azalt'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
