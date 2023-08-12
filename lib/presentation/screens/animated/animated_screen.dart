import 'dart:math' show Random;
import 'package:flutter/material.dart';

final List<MaterialColor> colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.cyan,
  Colors.brown,
  Colors.indigo
];

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
    width = Random().nextInt(300) + 50;
    height = Random().nextInt(300) + 50;
    borderRadius = Random().nextInt(100) + 5;

    color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: color
              ),
            ),

            const SizedBox(height: 50,),

            Text('Width: $width'),

            const SizedBox(height: 20,),

            Text('Height $height'),

            const SizedBox(height: 20,),

            Text('Border Radius: $borderRadius'),
            
            const SizedBox(height: 20,),

            Text('Color: $color')
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          changeShape();
        },
        child: const Icon(
          Icons.play_circle
        ),
      ),
    );
  }
}