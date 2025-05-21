import 'dart:math';
import 'package:get/get.dart';

class NumberController extends GetxController {
  RxInt randomNumber = 0.obs;
  void randomGenerator() {
    randomNumber.value = Random().nextInt(100);
  }
}
