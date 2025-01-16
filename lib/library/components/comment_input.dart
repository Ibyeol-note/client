import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0, left: 8, right: 8),
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              minLines: 1,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "로그인 후 답글을 남겨주세요.",
                hintStyle: Typos.bodySmall.copyWith(color: MyColors.fontGray),
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
      ),
    );
  }
}
