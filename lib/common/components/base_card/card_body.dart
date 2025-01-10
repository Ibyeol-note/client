import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final String bodyText;
  final TextStyle style;
  final int? maxLines;

  final VoidCallback? onTap;

  // custom theme
  final BoxDecoration? decoration;

  const CardBody({
    super.key,
    required this.bodyText,
    required this.style,
    this.maxLines = 6,
    this.decoration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: decoration,
        child: Text(
          bodyText,
          textAlign: TextAlign.left,
          style: style,
          overflow: TextOverflow.clip,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
