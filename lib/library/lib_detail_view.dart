import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/constants/strings.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/utils/string_extension.dart';
import 'package:ibyeol_note/common/widgets/app_bar_btn.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/library/components/comment_card.dart';
import 'package:ibyeol_note/library/components/comment_input.dart';
import 'package:ibyeol_note/library/components/library_card.dart';
import 'package:ibyeol_note/library/components/library_detail_card.dart';
import 'package:ibyeol_note/library/components/recomment_card.dart';

class LibDetailView extends StatelessWidget {
  const LibDetailView({super.key, required this.hasComment});

  final bool hasComment; // [TODO] 추후 삭제
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final bodyHeight = DefaultText.dummy.height(sWidth - 32, Typos.bodySmall);
    final double commentHeight =
        sHeight - bodyHeight - 322 > 0 ? sHeight - bodyHeight - 322 : 60;

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
        padding:
            EdgeInsets.only(bottom: 54 + MediaQuery.of(context).padding.bottom),
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
                  "답글 상세보기(${hasComment ? tempComments.length + tempComments.map((e) => e.reComments.length).toList().reduce((val, e) => val + e) : 0}개)",
                  style: Typos.captionMedium.copyWith(
                    color: MyColors.fontLightGray,
                  ),
                ),
              ),
              hasComment
                  ? ListView.separated(
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
                  : SizedBox(
                      height: commentHeight,
                      child: Center(
                        child: Text(
                          "첫 답글을 남겨주세요.",
                          style: Typos.bodySmall.copyWith(
                            color: MyColors.fontGray,
                          ),
                        ),
                      ),
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
