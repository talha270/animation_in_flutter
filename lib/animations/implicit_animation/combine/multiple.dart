import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplexAnimationExample extends StatelessWidget {
  final Rx<Alignment> alignment = Alignment.topLeft.obs;
  final RxDouble size = 100.0.obs;
  final RxDouble opacity = 1.0.obs;
  final RxDouble rotation = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: opacity.value,
          child: AnimatedAlign(
            duration: Duration(seconds: 1),
            alignment: alignment.value,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: size.value,
              height: size.value,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AnimatedRotation(
                duration: Duration(seconds: 1),
                turns: rotation.value,
                child: Center(child: Text("Hello", style: TextStyle(color: Colors.white))),
              ),
            ),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alignment.value =
          alignment.value == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft;
          size.value = size.value == 100 ? 200 : 100;
          opacity.value = opacity.value == 1.0 ? 0.2 : 1.0;
          rotation.value += 0.5;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
