import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/utils/datetime_extensions.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.postTime,
      required this.content,
      required this.onTap});

  final DateTime postTime;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postTime.kor(),
                style: Typos.captionMedium
                    .copyWith(color: MyColors.fontLightGray)),
            const SizedBox(height: 16),
            Text(
              content,
              style: Typos.bodySmall.copyWith(color: MyColors.fontBlack),
              maxLines: 6,
            )
          ],
        ),
      ),
    );
  }
}
