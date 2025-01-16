import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibyeol_note/common/constants/strings.dart';
import 'package:ibyeol_note/common/models/enums/note_detail_status.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';
import 'package:ibyeol_note/common/utils/datetime_extensions.dart';
import 'package:ibyeol_note/common/widgets/app_bar_btn.dart';
import 'package:ibyeol_note/common/widgets/custom_app_bar.dart';
import 'package:ibyeol_note/note/widgets/note_cancel_dialog.dart';

class NoteDetailView extends StatefulWidget {
  const NoteDetailView({super.key, required this.initStatus, this.initContent});

  final NoteDetailStatus initStatus;
  final String? initContent;

  @override
  State<NoteDetailView> createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  late TextEditingController _controller;
  late NoteDetailStatus _status;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initContent);
    _status = widget.initStatus;
    super.initState();
  }

  void setStatus(NoteDetailStatus newStatus) {
    setState(() {
      _status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool toForget = true; // [TODO] Setting 값 으로 대체
    return Scaffold(
      appBar: LineAppBar(
        child: AppBar(
          surfaceTintColor: Colors.white,
          forceMaterialTransparency: true,
          toolbarHeight: 48,
          leading: AppBarBtn(
            icon: Icons.close_rounded,
            onTap: () {
              if (_status == NoteDetailStatus.read) {
                Navigator.pop(context);
              } else if (widget.initContent != null &&
                  _controller.text != widget.initContent) {
                showCupertinoDialog(
                  context: context,
                  builder: (_) => NoteCancelDialog(
                    title: "수정을 취소하시겠습니까?",
                    msg: "해당 페이지를 벗어나면 지금까지 수정한 내용이 사라집니다.",
                    btns: [
                      Btn((
                        "확인",
                        () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      ))
                    ],
                    cancelAction: "수정",
                  ),
                );
              } else if (widget.initContent == null &&
                  _controller.text.isNotEmpty) {
                showCupertinoDialog(
                  context: context,
                  builder: (_) => NoteCancelDialog(
                    title: "작성을 취소하시겠습니까?",
                    msg: "해당 페이지를 벗어나면 지금까지 작성한 내용이 사라집니다.",
                    btns: [
                      Btn((
                        "작성취소",
                        () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      ))
                    ],
                    cancelAction: "수정",
                  ),
                );
              } else {
                Navigator.pop(context);
              }
            },
          ),
          titleSpacing: 0,
          leadingWidth: 48,
          actions: switch (_status) {
            NoteDetailStatus.write => [
                AppBarBtn(icon: Icons.smart_toy_outlined, onTap: () {}),
                AppBarBtn(icon: Icons.publish_rounded, onTap: () {}),
              ],
            NoteDetailStatus.read => [
                PopupMenuButton(
                  // [TODO] 추후 위젯 변경
                  icon: const Icon(Icons.more_horiz_rounded),
                  iconSize: 32,
                  surfaceTintColor: Colors.transparent,
                  color: Colors.white.withOpacity(0.9),
                  menuPadding: const EdgeInsets.symmetric(vertical: 6),
                  popUpAnimationStyle: AnimationStyle.noAnimation,
                  itemBuilder: (_) {
                    final btns = <Btn>[
                      Btn(("삭제", () {})),
                      Btn((
                        "수정",
                        () {
                          setStatus(NoteDetailStatus.edit);
                          print("[PRINT] 수정 버튼 클릭");
                        },
                      )),
                      Btn(("공유", () {})),
                    ];
                    return btns
                        .map(
                          (e) => PopupMenuItem(
                            onTap: e.onTap,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            child: Text(
                              e.txt,
                              style: Typos.captionLarge.copyWith(
                                color: MyColors.fontDarkGray,
                              ),
                            ),
                          ),
                        )
                        .toList();
                  },
                ),
              ],
            NoteDetailStatus.edit => [
                AppBarBtn(
                  icon: Icons.publish_rounded,
                  onTap: () => setStatus(NoteDetailStatus.read),
                ),
              ]
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              16, 24, 16, 32 + MediaQuery.of(context).viewPadding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateTime.now().kor(),
                style: Typos.captionMedium.copyWith(color: MyColors.fontGray),
              ),
              const SizedBox(height: 16),
              TextField(
                enabled: _status != NoteDetailStatus.read,
                controller: _controller,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                decoration: InputDecoration(
                  hintText:
                      toForget ? DefaultText.toForget : DefaultText.toHold,
                  hintMaxLines: 2,
                  hintStyle:
                      Typos.bodyLarge.copyWith(color: MyColors.fontBlack),
                  border: InputBorder.none,
                ),
                style: Typos.bodySmall.copyWith(color: MyColors.fontBlack),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
