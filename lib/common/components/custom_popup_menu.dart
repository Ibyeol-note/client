import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

void showCustomPopupMenu(BuildContext context, {required CustomMenuPosition position, required List<CustomMenuItem> menuItems}) =>
    showDialog(context: context, builder: (context) => CustomPopupMenu(position: position, menuItems: menuItems));

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key, required this.icon, required this.menuItems});

  final List<CustomMenuItem> menuItems;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final Offset position = button.localToGlobal(Offset.zero);

        showCustomPopupMenu(
          context,
          position: CustomMenuPosition(
            left: position.dx + button.size.width - 8 - MediaQuery.of(context).size.width * 0.4,
            top: position.dy - (button.size.height / 2) + 4,
          ),
          menuItems: menuItems,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: icon,
      ),
    );
  }
}

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({
    super.key,
    required this.position,
    required this.menuItems,
  });

  final CustomMenuPosition position;
  final List<CustomMenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: position.right,
          top: position.top,
          left: position.left,
          bottom: position.bottom,
          child: Material(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                maxWidth: MediaQuery.of(context).size.width * 0.4,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: menuItems.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = menuItems.elementAt(index);
                  return Material(
                    color: Colors.white.withAlpha((255 * 0.7).toInt()),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: index == 0 ? const Radius.circular(8) : Radius.zero,
                        bottom: index == menuItems.length - 1 ? const Radius.circular(8) : Radius.zero,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.vertical(
                        top: index == 0 ? const Radius.circular(8) : Radius.zero,
                        bottom: index == menuItems.length - 1 ? const Radius.circular(8) : Radius.zero,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        item.onTap();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          item.title,
                          style: Typos.captionLarge.copyWith(color: MyColors.fontDarkGray),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomMenuPosition {
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  CustomMenuPosition({this.left, this.top, this.right, this.bottom});
}

class CustomMenuItem {
  final String title;
  final VoidCallback onTap;

  CustomMenuItem({required this.title, required this.onTap});
}
