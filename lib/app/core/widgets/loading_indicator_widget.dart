import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final double size;
  final Color color;
  final double? strokeWidth;
  const LoadingIndicatorWidget({
    Key? key,
    this.strokeWidth,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(color),
          strokeWidth: strokeWidth ?? 4.0,
        ),
      ),
    );
  }
}
