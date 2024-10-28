import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/settings/settings_repository.dart';

class AppSettingsView extends ConsumerWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          ListTile(
            title: Text(settings.getSetting('fontSize').name),
            subtitle: Text(settings.getSetting('fontSize').explain),
            trailing: SizedBox(
              width: 100,
              child: Slider(
                value: settings.getValue<double>('fontSize'),
                min: 12.0,
                max: 24.0,
                divisions: 12,
                label: settings.getValue<double>('fontSize').round().toString(),
                onChanged: (value) {
                  ref.read(settingsProvider.notifier).updateSetting('fontSize', value);
                },
              ),
            ),
          ),
          SwitchListTile(
            title: Text(settings.getSetting('isDarkMode').name),
            subtitle: Text(settings.getSetting('isDarkMode').explain),
            value: settings.getValue<bool>('isDarkMode'),
            onChanged: (value) {
              ref.read(settingsProvider.notifier).updateSetting('isDarkMode', value);
            },
          ),
          SwitchListTile(
            title: Text(settings.getSetting('notificationsEnabled').name),
            subtitle: Text(settings.getSetting('notificationsEnabled').explain),
            value: settings.getValue<bool>('notificationsEnabled'),
            onChanged: (value) {
              ref.read(settingsProvider.notifier).updateSetting('notificationsEnabled', value);
            },
          ),
        ],
      ),
    );
  }
}
