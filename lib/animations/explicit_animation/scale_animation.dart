import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animationcontroller.dart';


class ScaleTransitionExample extends StatelessWidget {
  final controller = Get.find<AnimatedContainerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scale Transition Example')),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.tweenanimation,
          builder: (context, child) {
            return ScaleTransition(
              scale: controller.tweenanimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.tweenstartAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
