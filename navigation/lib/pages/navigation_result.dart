import 'package:flutter/material.dart';

class NavigationResultDemo extends StatefulWidget {
  const NavigationResultDemo({super.key});

  @override
  State<NavigationResultDemo> createState() => _NavigationResultDemoState();
}

class _NavigationResultDemoState extends State<NavigationResultDemo> {
  String? _selectedColor = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Geri dönüş değeri")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var _renk = await Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => RenkSec()));
                if (_renk != null) {
                  setState(() {
                    _selectedColor = _renk;
                  });
                }
              },
              child: const Text("Renk Seç"),
            ),
            const SizedBox(height: 20),
            Text(_selectedColor ?? "Renk seçilmedi"),
          ],
        ),
      ),
    );
    ;
  }
}

class RenkSec extends StatelessWidget {
  const RenkSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Renk seçimi")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildColorButton(context, "Red"),
            _buildColorButton(context, "Blue"),
            _buildColorButton(context, "Green"),
            _buildColorButton(context, "Yellow"),
          ],
        ),
      ),
    );
  }
}

Widget _buildColorButton(BuildContext context, String color) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 8.0),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pop(context, color);
      },
      child: Text(color),
    ),
  );
}
