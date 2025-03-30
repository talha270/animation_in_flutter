import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CombinedAnimationExample extends StatefulWidget {
  @override
  State<CombinedAnimationExample> createState() => _CombinedAnimationExampleState();
}

class _CombinedAnimationExampleState extends State<CombinedAnimationExample> {
  final RxDouble size = 50.0.obs;

  final RxDouble opacity = 0.0.obs;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1),() {
      size.value=350;
      opacity.value=1;
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: opacity.value,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: size.value,
            height: size.value,
            color: Colors.blue,
            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8Fettjl2rGDjHBlCYCXcWMRAoKDr_AQOoXQ&s",fit: BoxFit.cover,),
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          size.value = size.value == 350 ? 50 : 350;
          opacity.value = opacity.value == 1 ? 0.0 : 1;
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
