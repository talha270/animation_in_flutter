import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedPaddingExample extends StatelessWidget {
  final RxDouble padding = 10.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          Center(
            child: Obx(() => AnimatedPadding(
              duration: Duration(seconds: 1),
              padding: EdgeInsets.all(padding.value),
              child: Container(width: 100, height: 100, color: Colors.blue),
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          padding.value = padding.value == 10.0 ? 50.0 : 10.0;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
