import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotateScaleExample extends StatelessWidget {
  final RxDouble rotation = 0.0.obs;
  final RxDouble scale = 1.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedRotation(
          turns: rotation.value,
          duration: Duration(seconds: 1),
          child: AnimatedScale(
            scale: scale.value,
            duration: Duration(seconds: 1),
            child: FloatingActionButton(
              onPressed: () {
                rotation.value += 0.5;
                scale.value = scale.value == 1.0 ? 1.5 : 1.0;
              },
              child: Icon(Icons.refresh),
            ),
          ),
        )),
      ),
    );
  }
}
