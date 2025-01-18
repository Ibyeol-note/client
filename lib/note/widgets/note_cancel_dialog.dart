import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

class NoteCancelDialog extends StatelessWidget {
  const NoteCancelDialog({
    super.key,
    required this.title,
    required this.msg,
    required this.btns,
    required this.cancelAction,
  });

  final String title;
  final String msg;
  final List<Btn> btns;
  final String cancelAction;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        title,
        style: Typos.bodyMedium.copyWith(
          color: MyColors.fontBlack,
        ),
      ),
      message: Text(
        msg,
        style: Typos.captionMedium.copyWith(color: MyColors.fontGray),
      ),
      actions: btns
          .map(
            (e) => CupertinoActionSheetAction(
              onPressed: e.onTap,
              child: Text(
                e.txt,
                style: Typos.bodySmall.copyWith(color: MyColors.fontBlack),
              ),
            ),
          )
          .toList(),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          "$cancelAction으로 돌아가기",
          style: Typos.bodySmall.copyWith(color: MyColors.fontBlack),
        ),
      ),
    );
  }
}

extension type Btn((String txt, VoidCallback onTap) prop) {
  String get txt => prop.$1;
  VoidCallback get onTap => prop.$2;
}
