import 'package:flutter/material.dart';

class CollapsibleContainer extends StatelessWidget {
  const CollapsibleContainer({
    required this.height,
    required this.width,
    required this.padding,
    required this.borderRadius,
    required this.color,
    required this.child,
  });

  final double height, width, padding, borderRadius;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: 10,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
