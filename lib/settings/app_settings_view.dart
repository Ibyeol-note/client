import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/settings/components/setting_list_tile.dart';

class AppSettingsView extends ConsumerWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SettingsListTile(
              title: '푸쉬 알림 설정',
              onTap: () {
                // 푸쉬 알림 설정 기능
              },
            ),
            SettingsListTile(
              title: '이용약관',
              onTap: () {
                // 이용약관 기능
              },
            ),
            SettingsListTile(
              title: '개인정보 처리방침',
              onTap: () {
                // 개인정보 처리방침 기능
              },
            ),
            SettingsListTile(
              title: '오픈소스 라이선스',
              onTap: () {
                // 오픈소스 라이선스 기능
              },
            ),
            SettingsListTile(
              title: '로그아웃',
              onTap: () {
                // 로그아웃 기능
              },
            ),
            SettingsListTile(
              title: '탈퇴',
              border: false,
              onTap: () {
                // 탈퇴 기능
              },
            ),
          ],
        ),
      ),
    );
  }
}
