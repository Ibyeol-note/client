import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'general_data_state.freezed.dart';

@freezed
class GeneralDataState<T> with _$GeneralDataState<T> {
  const factory GeneralDataState.initial() = _Initial<T>;
  const factory GeneralDataState.loading() = _Loading<T>;
  const factory GeneralDataState.success(T data) = _Success<T>;
  const factory GeneralDataState.error(Object error) = _Error<T>;
}

class GeneralDataStateNotifier<T> extends StateNotifier<GeneralDataState<T>> {
  GeneralDataStateNotifier() : super(const GeneralDataState.initial());

  void setLoading() {
    state = const GeneralDataState.loading();
  }

  void setSuccess(T data) {
    state = GeneralDataState.success(data);
  }

  void setError(Object error) {
    state = GeneralDataState.error(error);
  }
}
