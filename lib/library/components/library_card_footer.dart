import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/utils/string_format.dart';

import '../../common/components/base_card/base_card.dart';

class LibraryCardFooter extends CardFooter {
  final bool isHoldOn;
  final int viewCount;
  final int bookmarkCount;

  const LibraryCardFooter({
    super.key,
    this.isHoldOn = true,
    this.viewCount = 0,
    this.bookmarkCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${isHoldOn ? '잊고싶어요' : '잡고싶어요'}·읽음 ${formatCount(viewCount)}·책갈피 ${formatCount(bookmarkCount)}',
      style: Typos.captionMedium.copyWith(
        color: MyColors.fontLightGray,
      ),
    );
  }
}
