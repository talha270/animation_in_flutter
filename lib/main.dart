import 'package:animation_in_flutter/animations/animatedcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animationcontroller.dart';
import 'animations/fade_animation.dart';
import 'animations/scale_animation.dart';
import 'animations/slides_animation.dart';
import 'animations/tween_animation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AnimatedContainerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      // AnimatedContainerExample(),
      // FadeTransitionExample()
      // TweenAnimatedContainerExample()
      // ScaleTransitionExample()
      SlideTransitionExample()
    );
  }
}

// Flutter animations are versatile and powerful, offering tools for creating smooth and visually appealing user experiences. Here's how we can approach learning them step-by-step:
//
// 1. Basic Concepts
// Implicit Animations: Learn animations where Flutter handles the interpolation.
// AnimatedContainer
// AnimatedOpacity
// AnimatedAlign
// AnimatedCrossFade
// Explicit Animations: Gain control over the animation sequence.
// AnimationController
// Tween
// CurvedAnimation
// 2. Animation Widgets
// Hero Animations: For seamless transitions between screens.
// FadeTransition: To fade widgets in and out.
// ScaleTransition: For scaling widgets.
// SlideTransition: For sliding widgets.
// 3. Advanced Animation Techniques
// CustomPaint and Canvas Animations: Drawing shapes and animating them.
// Transformations: Using Transform for 3D effects and rotations.
// Animation Builder: Using AnimatedBuilder for complex animations.
// 4. Third-Party Libraries
// Explore packages like rive, lottie, and flutter_spinkit.
// 5. Practical Examples
// Implement animations step-by-step with live examples.
// Add interactivity and gestures to animations.
// Would you like to start with a specific type, or should we begin with the basics of implicit animations?