import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/components/base_card/base_card.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/library/components/library_card_header.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.data});

  final CommentCardData data;
  @override
  Widget build(BuildContext context) {
    final reCommentsNum = data.reComments.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: BaseCard(
        header: Row(
          children: [
            Expanded(
              child: HeaderProfile(
                writter: data.writter,
                date: data.date,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.more_vert,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        body: Text(
          data.bodyText,
          style: Typos.bodySmall,
        ),
        footer: reCommentsNum > 0
            ? Row(
                children: [
                  Text(
                    data.reComments[0].writter,
                    style: Typos.captionMedium.copyWith(
                      color: MyColors.fontDarkGray,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    "${reCommentsNum > 1 ? "외 ${reCommentsNum - 1}명이" : "(이)가"} 답글을 남겼습니다.",
                    style: Typos.captionMedium.copyWith(
                      color: MyColors.fontLightGray,
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}

class CommentCardData extends CardData {
  // footer data
  final String? profileImage;
  final List<ReCommentCardData> reComments;

  const CommentCardData({
    required super.date,
    required super.writter,
    required super.bodyText,
    required this.reComments,
    this.profileImage,
  });
}

class ReCommentCardData extends CardData {
  final String? profileImage;

  const ReCommentCardData({
    required super.date,
    required super.writter,
    required super.bodyText,
    this.profileImage,
  });
}
