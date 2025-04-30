import 'package:flutter/material.dart';
import 'package:navigation/pages/basic_nav.dart';
import 'package:navigation/pages/veri_aktar%C4%B1m%C4%B1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator usage"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNavigationButton(
              "Basic Navigation",
              "Push and pop",
              onPressed: () {
                debugPrint("Basic Navigation");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BasicNavigation()),
                );
              },
            ),
            _buildNavigationButton(
              "isimlendirilimiş rotalar",
              "named route kullanımı",
              onPressed: () {
                debugPrint("Isimlendrilimiş rotalar");
              },
            ),
            _buildNavigationButton(
              "veri aktarımı",
              "sayfalar arası veri gönderme",
              onPressed: () {
                debugPrint("Veri aktarımı");
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VeriAktarimiDemo(),))
              },
            ),
            _buildNavigationButton(
              "geri dünüş değeri",
              "sayfadan veri alma",
              onPressed: () {
                debugPrint("Return value");
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildNavigationButton(
    String myTitle,
    String mySubtitle, {
    required VoidCallback onPressed,
  }) {
    return Card(
      child: ListTile(
        title: Text(myTitle),
        subtitle: Text(mySubtitle),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
