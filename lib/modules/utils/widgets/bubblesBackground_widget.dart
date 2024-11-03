import 'package:flutter/material.dart';

class BubblesBackgroundWidget extends StatelessWidget {
  const BubblesBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -40,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: -240,
          right: -130,
          child: Container(
            width: 420,
            height: 420,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          right: 50,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
