import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/constants/strings.dart';
import 'package:ibyeol_note/common/models/enums/note_detail_status.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/note/widgets/note_card.dart';

class MyWritingView extends StatelessWidget {
  const MyWritingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (_, idx) => NoteCard(
              postTime: DateTime.now(),
              content: DefaultText.dummy,
              onTap: () {
              },
            ),
            separatorBuilder: (_, __) =>
                const Divider(height: 1, thickness: 1, color: MyColors.gray50),
          )
        ],
      ),
    );
  }
}
