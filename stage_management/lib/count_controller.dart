

import 'package:get/get.dart';

class CountController extends GetxController{
  int count = 0;
  void increase()
  {
    count++;
    update();
  }
}