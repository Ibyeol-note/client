import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/components/base_card/base_card.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/library/components/library_card.dart';
import 'package:ibyeol_note/library/components/library_card_footer.dart';
import 'package:ibyeol_note/library/components/library_card_header.dart';

class LibraryDetailCard extends StatelessWidget {
  final LibraryCardData data;

  final VoidCallback? onBodyTap;

  final Color backgroundColor;
  final BoxDecoration? boxDecoration;

  const LibraryDetailCard({
    super.key,
    required this.data,
    this.onBodyTap,
    this.backgroundColor = MyColors.gray50,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      decoration: boxDecoration,
      header: HeaderProfile(
        date: data.date,
        writter: data.writter,
        profileImage: data.profileImage,
      ),
      body: CardBody(
        bodyText: data.bodyText,
        style: Typos.bodySmall,
        onTap: onBodyTap,
        maxLines: null,
      ),
      footer: LibraryCardFooter(
        isHoldOn: data.isHoldOn,
        viewCount: data.viewCount,
        bookmarkCount: data.bookmarkCount,
      ),
    );
  }
}
