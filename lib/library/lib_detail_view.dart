import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/widgets/app_bar_btn.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/library/components/comment_card.dart';
import 'package:ibyeol_note/library/components/library_card.dart';
import 'package:ibyeol_note/library/components/library_detail_card.dart';

class LibDetailView extends StatelessWidget {
  const LibDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final tempComments = List.generate(
      10,
      (idx) => CommentCardData(
        date: DateTime.now(),
        writter: "작성자명",
        bodyText:
            "댓글 내용이 작성되어 있습니다. 해당 내용에 대한 글자수 제한은 별도로 없습니다. 가로 328 fill을 넘어가지 않도록 설정하며, 최대 2줄에 해당되는 내용까지만 제공합니다.",
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

    return SafeArea(
      child: Scaffold(
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
                      bodyText:
                          '작성자가 기입한 내용에 대해 제공합니다. 이때 제공한 내용에 대해 가로 272 fill을 넘어가지 않도록 설정하며, 해당 가로 길이를 넘어갈 경우 다음 줄로 넘어갑니다.\n작성된 내용이 컨테이너 68 fill을 넘어가면 ...처리없이 그대로 제공합니다.\n작성자가 기입한 내용에 대해 제공합니다. 이때 제공한 내용에 대해 가로 272 fill을 넘어가지 않도록 설정하며, 해당 가로 길이를 넘어갈 경우 다음 줄로 넘어갑니다.',
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
            constraints: const BoxConstraints(
              minHeight: 54,
              maxHeight: 100,
              minWidth: double.infinity,
              maxWidth: double.infinity,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: MyColors.gray500,
                  width: 1,
                ),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "로그인 후 답글을 남겨주세요.",
                      hintStyle:
                          Typos.bodySmall.copyWith(color: MyColors.fontGray),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    style: Typos.bodySmall.copyWith(color: MyColors.fontBlack),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_rounded,
                    size: 32,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
