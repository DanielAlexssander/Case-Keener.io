import 'package:flutter/material.dart';

class IconPersonWidget extends StatelessWidget {
  const IconPersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.cyan,
        child: Icon(
          Icons.person,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
