import 'package:flutter/material.dart';
import 'package:flutter_listeler_json_veri/dio_kullanimi.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Liste ve Veri Islemleri'),
        ),
        body: const DioKullanimi(),
      ),
    );
  }
}
