import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/common/styles/typos.dart';

import 'package:ibyeol_note/settings/settings_repository.dart';
import 'package:ibyeol_note/settings/components/setting_list_tile.dart';

import 'package:ibyeol_note/settings/app_settings_view.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://loremflickr.com/600/400',
                    width: 120,
                    height: 120,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '잡고 싶은  닉네임 님',
                  style: Typos.bodySmall,
                ),
              ],
            ),
          ),
          SettingsListTile(
              title: '추억 보관함',
              onTap: () {
                // 추억 보관함 페이지로 이동
              }),
          SettingsListTile(
              title: '우리의 이야기',
              onTap: () {
                // 우리의 이야기 페이지로 이동
              }),
          SettingsListTile(
              title: '고객 제안',
              onTap: () {
                // 고객 제안 페이지로 이동
              }),
          SettingsListTile(
              title: '설정',
              border: false,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppSettingsView(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
