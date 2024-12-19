import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibyeol_note/settings/app_settings.dart';
import 'package:ibyeol_note/settings/models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  static const String _settingsKey = 'app_settings';

  Future<void> saveSettings(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    final String settingsJson = jsonEncode(settings.toJson());
    await prefs.setString(_settingsKey, settingsJson);
  }

  Future<AppSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final String? settingsJson = prefs.getString(_settingsKey);
    if (settingsJson != null) {
      final Map<String, dynamic> settingsMap = jsonDecode(settingsJson);
      return AppSettings.fromJson(settingsMap);
    }
    return AppSettings.defaults();
  }

  Future<AppSettings> loadFromServer() async {
    try {
      // 실제 서버에서 가져오는 부분
      // final serverSettings = await ;
      final Map<String, SettingsModel> settings = {};
      // saveSettings(serverSettings);
      final appSettings = AppSettings(settings: settings);
      return appSettings;
    } catch (e) {
      print('Failed to load settings from server: $e');
      return AppSettings.defaults();
    }
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  return SettingsNotifier(SettingsRepository());
});

class SettingsNotifier extends StateNotifier<AppSettings> {
  final SettingsRepository _repository;

  SettingsNotifier(this._repository) : super(AppSettings.defaults()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await _repository.loadSettings();
    state = settings;
  }

  Future<void> _loadFromServer() async {
    final settings = await _repository.loadFromServer();
    state = settings;
  }

  Future<void> updateSetting<T>(String key, T value) async {
    state = state.updateSetting(key, value);
    await _repository.saveSettings(state);
  }
}
