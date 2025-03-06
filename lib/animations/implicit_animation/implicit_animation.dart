import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animationcontroller.dart';
// implicit animation (means build in widget give by flutter)
// ✅ AnimatedContainer – Animates size, padding, margin, and color changes.
// ✅ AnimatedOpacity – Fades in/out an element.
// ✅ AnimatedAlign – Moves a widget within a parent container.
// ✅ AnimatedPositioned – Moves a widget inside a Stack.
// ✅ AnimatedSwitcher – Animates switching between widgets.
// ✅ AnimatedCrossFade – Fades between two widgets.
// ✅ AnimatedDefaultTextStyle – Animates text styling changes.
// ✅ TweenAnimationBuilder – Tweens (gradually changes) values over time.

class AnimatedContainerExample extends StatelessWidget {
  final controller = Get.find<AnimatedContainerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedContainer Example')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Animated container",style:TextStyle( fontSize: 30),),
              GestureDetector(
                onTap: controller.toggleSize,
                child: Obx(
                      () => AnimatedContainer(
                        alignment:
                        controller.isLarge.value ? Alignment.center : Alignment.topRight,
                    duration: Duration(seconds: 1),
                    width: controller.isLarge.value ? 200 : 100,
                    height: controller.isLarge.value ? 200 : 100,
                    curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                    color: controller.isLarge.value ? Colors.blue : Colors.red,
                          borderRadius: BorderRadius.circular(controller.isLarge.value?30:0),
                          border: Border.all(color: Colors.green,width: controller.isLarge.value?10:2),
                        ),
                        child: Text("Tap Me", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Animated opacity",style:TextStyle( fontSize: 30),),
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
              Text("Animated align",style:TextStyle( fontSize: 30),),
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
              Text("Animated cross fade",style:TextStyle( fontSize: 30),),
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
      ),
    );
  }
}