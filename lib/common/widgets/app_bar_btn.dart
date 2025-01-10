import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';

class AppBarBtn extends StatelessWidget {
  const AppBarBtn(
      {super.key,
      required this.icon,
      required this.onTap,
      this.iconColor = MyColors.iconBlack});

  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 32,
          color: iconColor,
        ),
      ),
    );
  }
}
