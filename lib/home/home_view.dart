import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/library/components/library_card.dart';
import 'package:ibyeol_note/common/styles/colors.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이별노트'),
      ),
      body: Container(
        color: MyColors.gray50,
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(color: MyColors.gray100),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 28.0),
            child: LibraryCard(
              data: LibraryCardData(
                date: DateTime.now(),
                writter: '작성자명',
                bodyText:
                    '작성자가 기입한 내용에 대해 제공합니다. 이때 제공한 내용에 대해 가로 272 fill을 넘어가지 않도록 설정하며, 해당 가로 길이를 넘어갈 경우 다음 줄로 넘어갑니다.\n작성된 내용이 컨테이너 68 fill을 넘어가면 ...처리없이 그대로 제공합니다.\n작성자가 기입한 내용에 대해 제공합니다. 이때 제공한 내용에 대해 가로 272 fill을 넘어가지 않도록 설정하며, 해당 가로 길이를 넘어갈 경우 다음 줄로 넘어갑니다.',
                isHoldOn: false,
                viewCount: 18200 + index,
                bookmarkCount: 1234 + index,
                profileImage: index % 3 == 0 ? null : 'https://picsum.photos/seed/${index + 1}/200/300',
                isBookmarked: index % 2 == 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
