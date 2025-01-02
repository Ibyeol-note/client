import 'package:flutter/material.dart';

export 'card_header.dart';
export 'card_body.dart';
export 'card_footer.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    this.header,
    this.footer,
    required this.body,
    this.width,
    this.decoration,
  });

  final Widget? header;
  final Widget body;
  final Widget? footer;
  final double? width;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null) header!,
            if (header != null) const SizedBox(height: 16),
            body,
            if (footer != null) const SizedBox(height: 16),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}

class CardData {
  // header data
  final DateTime date;
  final String writter;

  // body data
  final String bodyText;

  const CardData({
    required this.date,
    required this.writter,
    required this.bodyText,
  });
}
