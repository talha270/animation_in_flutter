import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoveResizeExample extends StatelessWidget {
  final Rx<Alignment> alignment = Alignment.topLeft.obs;
  final RxDouble size = 100.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedAlign(
          duration: Duration(seconds: 1),
          alignment: alignment.value,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: size.value,
            height: size.value,
            color: Colors.blue,
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alignment.value =
          alignment.value == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft;
          size.value = size.value == 100 ? 200 : 100;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
