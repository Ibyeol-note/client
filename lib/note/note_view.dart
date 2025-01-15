import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/models/enums/note_detail_status.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/note/note_detail_view.dart';
import 'package:ibyeol_note/note/widgets/my_bookmark_view.dart';
import 'package:ibyeol_note/note/widgets/my_writing_view.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.iconWhite,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.edit_rounded,
          size: 28,
          color: Colors.white,
        ),
      ),
      appBar: CustomAppBar(
          title: "Note",
          icon: const Icon(Icons.more_horiz_rounded),
          onIconTap: () {}),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [Tab(text: "나의 글"), Tab(text: "담은 글")],
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: MyColors.gray500,
            indicatorWeight: 2,
            indicatorPadding: EdgeInsets.zero,
            dividerColor: MyColors.gray100,
            dividerHeight: 2,
            labelStyle: Typos.captionLarge.copyWith(color: MyColors.fontBlack),
            unselectedLabelColor: MyColors.fontLightGray,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                MyWritingView(),
                MyBookmarkView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
