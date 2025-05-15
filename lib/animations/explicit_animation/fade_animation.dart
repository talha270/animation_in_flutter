import 'package:animation_in_flutter/animations/explicit_animation/controllers/fade_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeTransitionExample extends StatelessWidget {
  final FadeAnimationController controller = Get.put(FadeAnimationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FadeTransition Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: controller.animationController,
                  child:GestureDetector(
                    onTap: controller.startAnimation,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: const Center(child: Text('Tap Me')),
                    ),
                  ),

                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: controller.startAnimation, // Start animation on button press
            child: const Text('Start Animation'),
          ),
          ElevatedButton(
            onPressed: controller.resetAnimation, // Optional: Reset animation
            child: const Text('Reset Animation'),
          ),
        ],
      ),
    );
  }
}
