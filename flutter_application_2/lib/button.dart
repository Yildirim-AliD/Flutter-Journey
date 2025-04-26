import 'package:flutter/material.dart';

class ButtonType extends StatelessWidget {
  const ButtonType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button Type")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.radio),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red),
              ),
              child: Text("Text Button"),
            ),
            TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.red;
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.green;
                  }
                }),
              ),
              icon: Icon(Icons.add),
              label: Text("Text Button with Icon"),
            ),

            ElevatedButton(onPressed: () {}, child: Text("Elevated Button")),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.grey,
              ),
              icon: Icon(Icons.remove),
              label: Text("Elevated Button"),
            ),
            OutlinedButton(onPressed: () {}, child: Text("Outlined Button")),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red.withAlpha(120),
                foregroundColor: Colors.white,
              ),
              icon: Icon(Icons.refresh),
              label: Text("Outlined Button with Icon"),
            ),
          ],
        ),
      ),
    );
  }
}
