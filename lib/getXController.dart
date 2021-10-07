import 'package:get/get.dart';

class GetXController extends GetxController {
  dynamic controller;
  var fabClicked = false.obs;

  void doAnimation() {
    fabClicked.value = !fabClicked.value;
    if (fabClicked.value) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }
}
