import 'package:flutter/material.dart';

extension TextSize on String {
  double height(double width, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: this,
        style: style.copyWith(
          overflow: TextOverflow.visible,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    textPainter.layout(maxWidth: width);
    return textPainter.size.height;
  }
}
