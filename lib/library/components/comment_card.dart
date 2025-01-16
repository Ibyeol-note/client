import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/components/base_card/base_card.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/library/comment_view.dart';
import 'package:ibyeol_note/library/components/library_card_header.dart';
import 'package:ibyeol_note/library/components/recomment_card.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.data});

  final CommentCardData data;

  @override
  Widget build(BuildContext context) {
    final reCommentsNum = data.reComments.length;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CommentView(comment: data),
          ),
        );
      },
      child: Padding(
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
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.gray100,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              "답글 $reCommentsNum",
              style: Typos.captionMedium.copyWith(
                color: MyColors.fontDarkGray,
              ),
            ),
          ),
        ),
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
