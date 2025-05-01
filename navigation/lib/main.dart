import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/pages/basic_nav.dart';
import 'package:navigation/pages/veri_aktar%C4%B1m%C4%B1.dart';
import 'package:navigation/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        var _cikilsinmi = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Çıkış"),
              content: Text("Çıkmak istediğinize emin misiniz ?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("Hayır"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Evet"),
                ),
              ],
            );
          },
        );

        if (_cikilsinmi ?? false) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Navigator usage"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildNavigationButton(
                "Basic Navigation",
                "Push and pop",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.Temel_navigation,
                    arguments: {"id": 1, "isim": 'Ali'},
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
                  Navigator.pushNamed(context, AppRoutes.veri_aktarimi);
                },
              ),
              _buildNavigationButton(
                "geri dünüş değeri",
                "sayfadan veri alma",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.return_with_pop);
                },
              ),
            ],
          ),
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
