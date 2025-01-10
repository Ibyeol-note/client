import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

class FilterBtn extends StatelessWidget {
  const FilterBtn(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap});

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child:
                    CircleAvatar(radius: 2, backgroundColor: MyColors.gray900),
              ),
            Text(
              label,
              style: Typos.captionLarge.copyWith(
                color: isSelected ? MyColors.fontBlack : MyColors.fontLightGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
