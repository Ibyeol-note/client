import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/constants/strings.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/widgets/app_bar_btn.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/library/components/comment_card.dart';
import 'package:ibyeol_note/library/components/comment_input.dart';
import 'package:ibyeol_note/library/components/library_card.dart';
import 'package:ibyeol_note/library/components/library_detail_card.dart';
import 'package:ibyeol_note/library/components/recomment_card.dart';

class LibDetailView extends StatelessWidget {
  const LibDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final tempComments = List.generate(
      10,
      (idx) => CommentCardData(
        date: DateTime.now(),
        writter: "작성자명",
        bodyText: DefaultText.commentDummy,
        reComments: idx % 2 == 0
            ? []
            : List.generate(
                idx,
                (idx) => ReCommentCardData(
                  date: DateTime.now(),
                  writter: "댓글 작성자명",
                  bodyText: "대댓글",
                ),
              ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LineAppBar(
        child: AppBar(
          surfaceTintColor: Colors.white,
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          toolbarHeight: 48,
          leading: AppBarBtn(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          titleSpacing: 0,
          leadingWidth: 48,
          actions: [
            AppBarBtn(icon: Icons.bookmark_border_outlined, onTap: () {}),
            AppBarBtn(icon: Icons.more_horiz_rounded, onTap: () {}),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 54),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 31),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: MyColors.gray100,
                      width: 1,
                    ),
                  ),
                ),
                child: LibraryDetailCard(
                  data: LibraryCardData(
                    date: DateTime.now(),
                    writter: '작성자명',
                    bodyText: DefaultText.dummy,
                    isHoldOn: false,
                    viewCount: 18200,
                    bookmarkCount: 1234,
                    profileImage: 'https://picsum.photos/200/300',
                    isBookmarked: true,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 12.5, 16, 11.5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: MyColors.gray500,
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  "답글 상세보기(${tempComments.length + tempComments.map((e) => e.reComments.length).toList().reduce((val, e) => val + e)}개)",
                  style: Typos.captionMedium.copyWith(
                    color: MyColors.fontLightGray,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, idx) => CommentCard(
                  data: tempComments[idx],
                ),
                separatorBuilder: (_, idx) => const Divider(
                  height: 1,
                  thickness: 1,
                  color: MyColors.gray100,
                ),
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        height: 56 + MediaQuery.of(context).padding.bottom,
        child: const CommentInput(),
      ),
    );
  }
}
