import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.g.dart';
part 'settings_model.freezed.dart';

@Freezed(copyWith: true, genericArgumentFactories: true)
class SettingsModel<T> with _$SettingsModel<T> {
  factory SettingsModel({
    required String name,
    required String explain,
    required String type,
    required T value,
  }) = _SettingsModel<T>;

  factory SettingsModel.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) => _$SettingsModelFromJson(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(dynamic Function(T) toJsonT) => super.toJson(toJsonT);
}
