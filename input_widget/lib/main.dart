import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:input_widget/date_time.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      locale: const Locale('tr', 'TR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('tr', 'TR'), Locale('en', 'US')],
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter Input Fields'),
        ),
        body: DateTimeKullanimiWidget(),
      ),
    );
  }
}
