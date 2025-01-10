import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.icon,
      this.onIconTap,
      this.hasDivider = false});

  final String title;
  final Widget? icon;
  final VoidCallback? onIconTap;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: hasDivider
            ? const Border(
                bottom: BorderSide(
                  color: MyColors.gray700,
                  width: 1,
                ),
              )
            : null,
        color: Colors.white,
      ),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 16,
        title: Text(title, style: Typos.headMedium),
        actions: [
          if (icon != null)
            GestureDetector(
              onTap: onIconTap,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: icon,
              ),
            ),
          const SizedBox(width: 8)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class LineAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LineAppBar({super.key, required this.child, this.hasDivider = true});

  final Widget child;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 4, 8, hasDivider ? 3 : 4),
      decoration: BoxDecoration(
        border: hasDivider
            ? const Border(
                bottom: BorderSide(
                  color: MyColors.gray700,
                  width: 1,
                ),
              )
            : null,
        color: Colors.white,
      ),
      child: child,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
