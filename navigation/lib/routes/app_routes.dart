import 'package:flutter/widgets.dart';
import 'package:navigation/main.dart';
import 'package:navigation/pages/basic_nav.dart';
import 'package:navigation/pages/navigation_result.dart';
import 'package:navigation/pages/veri_aktar%C4%B1m%C4%B1.dart';

class AppRoutes {
  static const String home = "/";
  static const String Temel_navigation = "/Basic";
  static const String return_with_pop = "/Return";
  static const String veri_aktarimi = "/veri_aktarimi";
  static Map<String, Widget Function(BuildContext)> get routes => {
    home: (context) => HomePage(),
    Temel_navigation: (context) => BasicNavigation(),
    veri_aktarimi: (context) => VeriAktarimiDemo(),
    return_with_pop: (context) => NavigationResultDemo(),
  };
}
