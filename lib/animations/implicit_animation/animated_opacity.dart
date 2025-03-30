import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedOpacityExample extends StatelessWidget {
  final RxDouble opacity = 1.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedOpacity(
          opacity: opacity.value,
          duration: Duration(seconds: 1),
          child: Container(width: 100, height: 100, color: Colors.blue),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opacity.value = opacity.value == 1.0 ? 0.0 : 1.0;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
