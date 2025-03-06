import 'package:animation_in_flutter/animationcontroller.dart';
import'package:flutter/material.dart';
import'package:get/get.dart';

class AnimatedSwitcherGetX extends StatelessWidget {
  final controller = Get.put(AnimatedContainerController());

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
                  ? Text("Hello", key: ValueKey(1), style: TextStyle(fontSize: 24))
                  : Icon(Icons.check, key: ValueKey(2), size: 50, color: Colors.green),
            )),
            ElevatedButton(
              onPressed: controller.toggleWidget,
              child: Text("Toggle"),
            ),
          ],
        ),
      ),
    );
  }
}