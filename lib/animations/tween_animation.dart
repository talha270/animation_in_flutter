import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animationcontroller.dart';

class TweenAnimatedContainerExample extends StatelessWidget {
  final AnimatedContainerController controller = Get.find<AnimatedContainerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation Example')),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.tweenanimation,
          builder: (context, child) {// Wrap only the widget that depends on the observable value.
              return Container(
                width: controller.tweenanimation.value,
                height: controller.tweenanimation.value,
                color: Colors.blue,
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
