import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

enum BotNavItems {
  library("라이브러리", Icons.book_outlined),
  note("노트", Icons.library_books_outlined),
  myPage("마이페이지", Icons.favorite_border_outlined);

  const BotNavItems(this.label, this.icon);
  final String label;
  final IconData icon;
}

class BotNav extends StatelessWidget {
  const BotNav({super.key, required this.idx, required this.changeIdx});

  final int idx;
  final Function(int) changeIdx;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58 + MediaQuery.of(context).padding.bottom,
      padding:
          EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: MyColors.gray200,
              width: 1,
            ),
          ),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: BotNavItems.values.map((e) {
          final itemIdx = BotNavItems.values.indexOf(e);
          return BotNavItem(
            icon: e.icon,
            label: e.label,
            isSelected: idx == itemIdx,
            onTap: () {
              changeIdx(BotNavItems.values.indexOf(e));
            },
          );
        }).toList(),
      ),
    );
  }
}

class BotNavItem extends StatelessWidget {
  const BotNavItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected,
      required this.onTap});

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: 72,
        height: 57,
        padding: const EdgeInsets.only(top: 7, bottom: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? MyColors.iconBlack : MyColors.iconLightGray,
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
