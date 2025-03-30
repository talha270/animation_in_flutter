import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedAlignExample extends StatelessWidget {
  final Rx<Alignment> alignment = Alignment.topLeft.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedAlign(
          duration: Duration(seconds: 1),
          alignment: alignment.value,
          child: Container(width: 100, height: 100, color: Colors.blue),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alignment.value =
          alignment.value == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
