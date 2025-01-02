import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/components/base_card/base_card.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/utils/string_format.dart';

class LibraryCardHeader extends CardHeader {
  const LibraryCardHeader({
    super.key,
    required super.date,
    required this.writter,
    this.profileImage,
    this.isBookmarked = false,
    this.onProfilePressed,
    this.onBookmarkPressed,
    this.bookmarkIcon = Icons.bookmark_border,
    this.bookmarkIconSelected = Icons.bookmark,
    this.writterTextStyle,
    this.dateTextStyle,
  });

  final String writter;
  final String? profileImage;
  final bool isBookmarked;
  final VoidCallback? onProfilePressed;
  final Function(bool)? onBookmarkPressed;

  // custom theme
  final TextStyle? writterTextStyle;
  final TextStyle? dateTextStyle;
  final IconData bookmarkIcon;
  final IconData bookmarkIconSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: HeaderProfile(
            writter: writter,
            date: date,
            profileImage: profileImage,
            writterTextStyle: writterTextStyle,
            dateTextStyle: dateTextStyle,
            onPressed: onProfilePressed,
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: Icon(isBookmarked ? bookmarkIconSelected : bookmarkIcon, size: 32),
          onPressed: () {
            onBookmarkPressed?.call(isBookmarked);
          },
        ),
      ],
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
    required this.writter,
    required this.date,
    this.profileImage,
    this.writterTextStyle,
    this.dateTextStyle,
    this.onPressed,
  });

  final String writter;
  final DateTime date;
  final VoidCallback? onPressed;
  final String? profileImage;

  // custom theme
  final TextStyle? writterTextStyle;
  final TextStyle? dateTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed ?? () {},
          icon: profileImage != null ? Image.network(profileImage!, width: 32, height: 32, fit: BoxFit.cover) : const Icon(Icons.person, size: 32),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('by $writter', style: writterTextStyle ?? Typos.captionMedium),
            Text(formatDateTime(date), style: dateTextStyle ?? Typos.captionMedium.copyWith(color: MyColors.fontLightGray)),
          ],
        ),
      ],
    );
  }
}
