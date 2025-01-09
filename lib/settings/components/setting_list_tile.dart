import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.title,
    required this.onTap,
    this.border = true,
  });

  final String title;
  final VoidCallback onTap;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: border
              ? const Border(
                  bottom: BorderSide(color: MyColors.gray100),
                )
              : null,
        ),
        child: Text(title, style: Typos.bodySmall),
      ),
    );
  }
}
