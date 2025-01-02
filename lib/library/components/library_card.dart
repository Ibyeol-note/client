import 'package:flutter/material.dart';

import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

import 'package:ibyeol_note/common/components/base_card/base_card.dart';

import 'package:ibyeol_note/library/components/library_card_footer.dart';
import 'package:ibyeol_note/library/components/library_card_header.dart';

class LibraryCard extends StatelessWidget {
  final LibraryCardData data;

  final VoidCallback? onBodyTap;

  // custom theme
  final Color backgroundColor;
  final BoxDecoration? boxDecoration;

  const LibraryCard({
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
      header: LibraryCardHeader(
        date: data.date,
        writter: data.writter,
        profileImage: data.profileImage,
        isBookmarked: data.isBookmarked,
      ),
      body: CardBody(
        bodyText: data.bodyText,
        style: Typos.bodySmall,
        onTap: onBodyTap,
      ),
      footer: LibraryCardFooter(isHoldOn: data.isHoldOn, viewCount: data.viewCount, bookmarkCount: data.bookmarkCount),
    );
  }
}

class LibraryCardData extends CardData {
  // footer data
  final bool isHoldOn;
  final int viewCount;
  final int bookmarkCount;
  final String? profileImage;
  final bool isBookmarked;

  const LibraryCardData({
    required super.date,
    required super.writter,
    required super.bodyText,
    this.profileImage,
    required this.isHoldOn,
    required this.viewCount,
    required this.bookmarkCount,
    required this.isBookmarked,
  });
}
