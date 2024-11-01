import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'general_state.freezed.dart';

@freezed
class GeneralState<T> with _$GeneralState<T> {
  const factory GeneralState.initial() = _Initial<T>;
  const factory GeneralState.loading() = _Loading<T>;
  const factory GeneralState.success(T data) = _Success<T>;
  const factory GeneralState.error(Object error) = _Error<T>;
}

class GenericDataStateNotifier<T> extends StateNotifier<GeneralState<T>> {
  GenericDataStateNotifier() : super(const GeneralState.initial());

  void setLoading() {
    state = const GeneralState.loading();
  }

  void setSuccess(T data) {
    state = GeneralState.success(data);
  }

  void setError(Object error) {
    state = GeneralState.error(error);
  }
}
