import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/settings/app_settings_view.dart';
import 'package:ibyeol_note/settings/settings_repository.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('이별노트'),
      ),
      body: Column(
        children: [
          Image.network(
            'https://loremflickr.com/600/400',
          ),
          Text('닉네임', style: TextStyle(fontSize: ref.read(settingsProvider).getValue('fontSize') - 2)),
          Text('닉네임 표시 부', style: TextStyle(fontSize: ref.read(settingsProvider).getValue('fontSize'))),
          TextButton(
            onPressed: () {},
            child: Text('잡고싶어요\n(잊고싶어요)', textAlign: TextAlign.center, style: TextStyle(fontSize: settings.getSetting('fontSize').value)),
          ),
          TextButton(
            onPressed: () {},
            child: Text('서비스 안내', textAlign: TextAlign.center, style: TextStyle(fontSize: settings.getSetting('fontSize').value)),
          ),
          TextButton.icon(
            label: Text('설정', style: TextStyle(fontSize: settings.getSetting('fontSize').value)),
            icon: const Icon(Icons.arrow_right),
            iconAlignment: IconAlignment.end,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AppSettingsView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
