import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/utils/datetime_extensions.dart';

class WriteCard extends StatelessWidget {
  const WriteCard({super.key, required this.toForget});

  final bool toForget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MyColors.gray200,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateTime.now().kor(),
              style:
                  Typos.captionMedium.copyWith(color: MyColors.fontLightGray)),
          const SizedBox(height: 16),
          TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: toForget
                  ? "잊고 싶은 그 사람과의 추억,\n이곳에 남겨두고 가요."
                  : "잡고 싶은 그 사람에 대한 기억,\n이곳에 적어둬요",
              hintStyle: Typos.bodySmall.copyWith(color: MyColors.fontGray),
              border: InputBorder.none,
              hintMaxLines: 2,
              contentPadding: EdgeInsets.zero,
            ),
            style: Typos.bodySmall.copyWith(color: MyColors.fontBlack),
          )
        ],
      ),
    );
  }
}
