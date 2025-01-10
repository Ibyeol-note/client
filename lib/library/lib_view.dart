import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/library/components/filter_btn.dart';
import 'package:ibyeol_note/library/components/write_card.dart';
import 'package:ibyeol_note/library/lib_detail_view.dart';
import 'package:ibyeol_note/library/components/library_card.dart';

class LibView extends StatelessWidget {
  const LibView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Library",
        icon: const Icon(Icons.search_rounded, size: 32),
        onIconTap: () {},
        hasDivider: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WriteCard(toForget: true),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilterBtn(label: "전체", isSelected: false, onTap: () {}),
                  FilterBtn(label: "잊고 싶을 때", isSelected: true, onTap: () {}),
                  FilterBtn(label: "잡고 싶을 때", isSelected: false, onTap: () {}),
                ],
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 32),
                child: LibraryCard(
                  onBodyTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LibDetailView(),
                      ),
                    );
                  },
                  data: LibraryCardData(
                    date: DateTime.now(),
                    writter: '작성자명',
                    bodyText:
                        '작성자가 기입한 내용에 대해 제공합니다. 이때 제공한 내용에 대해 가로 272 fill을 넘어가지 않도록 설정하며, 해당 가로 길이를 넘어갈 경우 다음 줄로 넘어갑니다.\n작성된 내용이 컨테이너 68 fill을 넘어가면 ...처리없이 그대로 제공합니다.\n작성자가 기입한 내용에 대해 제공합니다. 이때 제공한 내용에 대해 가로 272 fill을 넘어가지 않도록 설정하며, 해당 가로 길이를 넘어갈 경우 다음 줄로 넘어갑니다.',
                    isHoldOn: false,
                    viewCount: 18200 + index,
                    bookmarkCount: 1234 + index,
                    profileImage: index % 3 == 0
                        ? null
                        : 'https://picsum.photos/seed/${index + 1}/200/300',
                    isBookmarked: index % 2 == 0,
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(
                  height: 1, thickness: 1, color: MyColors.gray50),
            )
          ],
        ),
      ),
    );
  }
}
