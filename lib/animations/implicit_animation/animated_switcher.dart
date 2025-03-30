import 'package:animation_in_flutter/animationcontroller.dart';
import'package:flutter/material.dart';
import'package:get/get.dart';

class AnimatedSwitcherGetX extends StatelessWidget {
  final controller = Get.put(AnimatedContainerController());
  final RxInt counter = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedSwitcher with GetX")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (widget, animation) =>
                  // SlideTransition(
                  //   position: animation.drive(Tween(begin: Offset(-1, 0), end: Offset(0, 0))),
                  //   child: widget,
                  // ),

              // FadeTransition(opacity: animation, child: widget),
                  RotationTransition(turns: animation, child: widget),
              child: controller.isText.value
                  ? Text("Hello", style: TextStyle(fontSize: 24))
                  : Icon(Icons.check, size: 50, color: Colors.green),
            )),
            ElevatedButton(
              onPressed: controller.toggleWidget,
              child: Text("Toggle"),
            ),
            Center(
              child: Obx(() => AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (widget, animation) => FadeTransition(
                  opacity: animation,
                  child: widget,
                ),
                child: Text(
                  counter.value.toString(),
                  key: ValueKey<int>(counter.value),
                  style: TextStyle(fontSize: 50),
                ),
              )),
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter.value++;
          },
          child: Icon(Icons.add),
        )
    );
  }
}