import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/library/components/comment_card.dart';
import 'package:ibyeol_note/library/components/comment_input.dart';
import 'package:ibyeol_note/library/components/recomment_card.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key, required this.comment});

  final CommentCardData comment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LineAppBar(
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 32),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 56),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommentCard(data: comment),
              const Divider(height: 1, thickness: 1, color: MyColors.gray100),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) =>
                    RecommentCard(data: comment.reComments[index]),
                separatorBuilder: (_, __) => const Divider(
                    height: 1, thickness: 1, color: MyColors.gray100),
                itemCount: comment.reComments.length,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        height: 56 + MediaQuery.of(context).padding.bottom,
        child: const CommentInput(),
      ),
    );
  }
}
