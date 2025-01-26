import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animationcontroller.dart';

class SlideTransitionExample extends StatelessWidget {
  final AnimatedContainerController controller = Get.find<AnimatedContainerController>();

  @override
  Widget build(BuildContext context) {
    // Initialize the animation when the widget is created
    // controller.initializeAnimation(TickerMode.of(context));

    return Scaffold(
      appBar: AppBar(title: const Text('Slide Transition Example')),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0), // starting position
                end: Offset(0.0, 0.0),   // end position
              ).animate(controller.animation),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.startAnimation,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
