import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/constants/strings.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/library/components/library_card.dart';

class MyBookmarkView extends StatelessWidget {
  const MyBookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, idx) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 24, 8, 32),
        child: LibraryCard(
          data: LibraryCardData(
            date: DateTime.now(),
            writter: '작성자명',
            isHoldOn: (idx % 2) == 0,
            viewCount: 18200 + idx,
            bookmarkCount: 1234 + idx,
            isBookmarked: true,
            profileImage: idx % 3 == 0
                ? null
                : 'https://picsum.photos/seed/${idx + 1}/200/300',
            bodyText: DefaultText.dummy,
          ),
        ),
      ),
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        thickness: 1,
        color: MyColors.gray50,
      ),
    );
  }
}
