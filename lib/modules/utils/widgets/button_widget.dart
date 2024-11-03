import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function function;
  final child;
  final color;

  const ButtonWidget(
      {super.key, required this.child, required this.function, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: FilledButton(
        onPressed: () {
          function();
        },
        child: child is String
            ? Text(
                child,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            : child,
        style: ButtonStyle(
          backgroundColor:
              color != null ? MaterialStateProperty.all<Color>(color) : null,
          minimumSize: WidgetStateProperty.all(Size(double.infinity, 40)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
