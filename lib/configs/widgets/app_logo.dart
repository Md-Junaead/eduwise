// Reusable logo widget to satisfy Top>Top (centered) requirement.

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double maxWidthFraction; // 0.6 means 60% of screen width
  const AppLogo({super.key, this.maxWidthFraction = 0.6});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * maxWidthFraction; // enforce ~20% gap on both sides
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Image.asset(
              'assets/images/logo/logo-red.png',
              fit: BoxFit.contain,
              semanticLabel: 'Main Logo',
            ),
          ),
        );
      },
    );
  }
}