import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedContainerController extends GetxController with GetTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;

  late AnimationController tweenanimationController;
  late Animation<double> tweenanimation;
  @override
  void onInit() {

    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
      // ..repeat(reverse: true,period: Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    // animationController.forward();

    tweenanimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    tweenanimation = Tween(begin: 100.0, end: 300.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    super.onInit();
  }
  void startAnimation() {
    animationController.forward();
  }

  // Optional: Reset animation if needed
  void resetAnimation() {
    animationController.reset();
  }

  void tweenstartAnimation() {
    animationController.forward();
  }
  @override
  void onClose() {
    animationController.dispose();
    tweenanimationController.dispose();
    super.onClose();
  }

  var isLarge = false.obs;

  void toggleSize() {
    isLarge.value = !isLarge.value;
  }


  var isVisible = true.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }

  var isTopLeft = true.obs;

  void toggleAlignment() {
    isTopLeft.value = !isTopLeft.value;
  }

  var showFirst = true.obs;

  void toggleCrossFade() {
    showFirst.value = !showFirst.value;
  }

  // <--------------animated switcher------------------>
  var isText = true.obs;
  void toggleWidget() => isText.value = !isText.value;
}