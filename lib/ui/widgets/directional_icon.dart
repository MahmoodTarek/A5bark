import 'dart:math' show pi;
import 'package:flutter/material.dart';

class DirectionalIcon extends StatelessWidget {
  final Widget child;

  const DirectionalIcon({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(pi),
      alignment: Alignment.center,
      child: child,
    );
  }
}
