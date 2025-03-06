import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionedController extends GetxController {
  var left = 0.0.obs;
  var top = 0.0.obs;

  void updatePosition(TapDownDetails details) {
    left.value = details.localPosition.dx - 25; // Adjusting for icon center
    top.value = details.localPosition.dy - 25;  // Adjusting for icon center
  }
}

class AnimatedPosition extends StatelessWidget {
  final controller = Get.put(PositionedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap to Move Icon")),
      body: Center(
        child: GestureDetector(
          onTapDown: controller.updatePosition, // Detect tap position
          child: Stack(
            children: [
              Container(width: 300, height: 300, color: Colors.grey[300]),
              Obx(() => AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: controller.left.value,
                top: controller.top.value,
                child:Icon(Icons.devices, size: controller.left.value<50? 50:100, color:controller.left.value<20? Colors.red:Colors.green),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
