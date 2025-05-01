import 'package:flutter/material.dart';

class BasicNavigation extends StatelessWidget {
  const BasicNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text("Basic navigation")),
      body: Center(
        child: Column(
          children: [
            Text(_args['id'].toString()),
            Text(_args['isim'].toString()),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ayarlar()),
                );
              },
              child: Text("Settings"),
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
              child: Text("Geri Dön"),
            ),
          ],
        ),
      ),
    );
  }
}

class Ayarlar extends StatelessWidget {
  const Ayarlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Geri Dön"),
            ),
          ],
        ),
      ),
    );
  }
}
