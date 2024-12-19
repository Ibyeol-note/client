import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibyeol_note/settings/models/settings_model.dart';

part 'app_settings.g.dart';
part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  const AppSettings._();

  const factory AppSettings({
    required Map<String, SettingsModel> settings,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

  T getValue<T>(String key, {T? value}) {
    final setting = settings[key];
    if (setting == null) {
      if (value != null) return value;
      throw Exception('Setting not found: $key');
    }
    if (setting.value is! T) {
      throw Exception('Type mismatch for setting $key. Expected ${T.toString()}, got ${setting.value.runtimeType}');
    }
    return setting.value as T;
  }

  SettingsModel getSetting(String key) {
    final setting = settings[key];
    if (setting == null) {
      throw Exception('Setting not found: $key');
    }
    return setting;
  }

  AppSettings updateSetting<T>(String key, T value) {
    final newSettings = Map<String, SettingsModel>.from(settings);
    final currentSetting = newSettings[key];
    if (currentSetting == null) {
      throw Exception('Setting not found: $key');
    }
    newSettings[key] = currentSetting.copyWith(value: value);
    return copyWith(settings: newSettings);
  }

  factory AppSettings.defaults() {
    return AppSettings(settings: {
      'fontSize': SettingsModel<double>(
        name: 'Font Size',
        explain: 'The size of the font used in the app',
        type: 'double',
        value: 16.0,
      ),
      'isDarkMode': SettingsModel<bool>(
        name: 'Dark Mode',
        explain: 'Enable or disable dark mode',
        type: 'bool',
        value: false,
      ),
      'notificationsEnabled': SettingsModel<bool>(
        name: 'Notifications',
        explain: 'Enable or disable notifications',
        type: 'bool',
        value: true,
      ),
    });
  }
}
