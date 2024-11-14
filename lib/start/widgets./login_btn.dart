import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    super.key,
    required this.txt,
    required this.icon,
    required this.bgColor,
    required this.onTap,
    this.txtColor = Colors.black,
    this.borderColor = Colors.transparent,
  });

  final String txt;
  final String icon;
  final Color txtColor;
  final Color bgColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              txt,
              style: TextStyle(color: txtColor),
            )
          ],
        ),
      ),
    );
  }
}
