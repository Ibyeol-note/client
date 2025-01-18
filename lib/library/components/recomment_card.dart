import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibyeol_note/common/components/base_card/base_card.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/library/components/library_card_header.dart';

class RecommentCard extends StatelessWidget {
  const RecommentCard({super.key, required this.data});

  final ReCommentCardData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: SvgPicture.asset(
              "assets/icons/ic_24_reply.svg",
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                  MyColors.iconLightGray, BlendMode.srcIn),
            ),
          ),
          Expanded(
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
            ),
          ),
        ],
      ),
    );
  }
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
