import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animationcontroller.dart';

class AnimatedContainerExample extends StatelessWidget {
  final controller = Get.find<AnimatedContainerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer Example')),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: controller.toggleSize,
              child: Obx(
                    () => AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: controller.isLarge.value ? 200 : 100,
                  height: controller.isLarge.value ? 200 : 100,
                  color: controller.isLarge.value ? Colors.blue : Colors.red,
                  curve: Curves.easeInOut,
                ),
              ),
            ),
            SizedBox(height: 20,),
                Obx(
                      () => AnimatedOpacity(
                    opacity: controller.isVisible.value ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Container(width: 100, height: 100, color: Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.toggleVisibility,
                  child: Text('Toggle Visibility'),
                ),

            SizedBox(height: 20,),
            Obx(
                  () => GestureDetector(
                onTap: controller.toggleAlignment,
                child: AnimatedAlign(
                  duration: Duration(seconds: 1),
                  alignment: controller.isTopLeft.value
                      ? Alignment.topLeft
                      : Alignment.bottomRight,
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),
            Obx(
                  () => GestureDetector(
                onTap: controller.toggleCrossFade,
                child: AnimatedCrossFade(
                  duration: Duration(seconds: 1),
                  firstChild: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                    child: Center(child: Text('First Widget')),
                  ),
                  secondChild: Container(
                    width: 200,
                    height: 200,
                    color: Colors.orange,
                    child: Center(child: Text('Second Widget')),
                  ),
                  crossFadeState: controller.showFirst.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}