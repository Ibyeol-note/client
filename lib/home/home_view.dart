import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/common/styles/colors.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이별노트'),
      ),
      body: const StyleExmaple(),
    );
  }
}

class StyleExmaple extends StatelessWidget {
  // [NOTICE] 확인용 위젯입니다. 확인이 충분히 되셨으면 지워주세요.
  const StyleExmaple({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextStyle> styles = [
      Typos.headLarge,
      Typos.headMedium,
      Typos.headSmall,
      Typos.titleLarge,
      Typos.titleMedium,
      Typos.titleSmall,
      Typos.bodyXLarge,
      Typos.bodyLarge,
      Typos.bodyMedium,
      Typos.bodySmall,
      Typos.captionLarge,
      Typos.captionMedium,
      Typos.captionSmall,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: styles
            .map((style) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text("이별노트입니다.",
                      style: style.copyWith(color: MyColors.gray500)),
                ))
            .toList(),
      ),
    );
  }
}
