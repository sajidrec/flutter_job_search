import 'package:flutter/material.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  final Color loaderColor, loaderBackgroundColor;
  final double loaderThickness;

  const CenterCircularProgressIndicator({
    super.key,
    required this.loaderColor,
    required this.loaderBackgroundColor,
    required this.loaderThickness,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: loaderColor,
      backgroundColor: loaderBackgroundColor,
      strokeWidth: loaderThickness,
    );
  }
}
