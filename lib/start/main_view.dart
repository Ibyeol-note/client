import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/widgets/bot_nav.dart';
import 'package:ibyeol_note/library/lib_view.dart';
import 'package:ibyeol_note/note/note_view.dart';
import 'package:ibyeol_note/settings/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int curIdx = 0;

  void changeIdx(int idx) {
    setState(() {
      curIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [LibView(), NoteView(), SettingsView()];
    return SafeArea(
      child: Scaffold(
        body: pages[curIdx],
        bottomNavigationBar: BotNav(idx: curIdx, changeIdx: changeIdx),
      ),
    );
  }
}
