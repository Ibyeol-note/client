import 'package:flutter/material.dart';

abstract class CardHeader extends StatelessWidget {
  final DateTime date;

  const CardHeader({super.key, required this.date});
}
