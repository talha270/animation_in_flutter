import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeAnimationController extends GetxController with GetTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {

    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    // ..repeat(reverse: true,period: Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    // animationController.forward();
    animationController.repeat(reverse: true);
    super.onInit();
  }
  void startAnimation() {
    animationController.forward();
    animationController.repeat(reverse: true);
  }

  // Optional: Reset animation if needed
  void resetAnimation() {
    animationController.reset();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

}