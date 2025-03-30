import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class Example1controller extends GetxController with GetSingleTickerProviderStateMixin{

  late AnimationController animationcontroller;
  late Animation<double> animation;

  @override
  void onInit() {
    animationcontroller=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    
    animation=Tween<double>(
      begin: 0,
      end: 2*pi
    ).animate(animationcontroller);

    animationcontroller.repeat();

    super.onInit();
  }

  @override
  void dispose() {
    animationcontroller.dispose();
    super.dispose();
  }

}
