import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedContainerExample extends StatelessWidget {
  final RxDouble size = 100.0.obs;
  final Rx<Color> color = Colors.blue.obs;
  final Rx<BorderRadius> borderRadius = BorderRadius.circular(10).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedContainer(
          duration: Duration(seconds: 1),
          width: size.value,
          height: size.value,
          decoration: BoxDecoration(
            color: color.value,
            borderRadius: borderRadius.value,
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          size.value = size.value == 100 ? 200 : 100;
          color.value = color.value == Colors.blue ? Colors.red : Colors.blue;
          borderRadius.value = borderRadius.value == BorderRadius.circular(10)
              ? BorderRadius.circular(50)
              : BorderRadius.circular(10);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
