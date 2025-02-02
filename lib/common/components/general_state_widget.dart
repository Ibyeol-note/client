import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ibyeol_note/common/models/general_data_state.dart';

class GeneralStateWidget<T> extends ConsumerWidget {
  final StateNotifierProvider<GeneralDataStateNotifier<T>, GeneralDataState<T>> provider;
  final Widget Function() initial;
  final Widget Function() loading;
  final Widget Function(T data) success;
  final Widget Function(Object error) error;

  const GeneralStateWidget({
    super.key,
    required this.provider,
    required this.initial,
    required this.loading,
    required this.success,
    required this.error,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    return state.when(
      initial: initial,
      loading: loading,
      success: success,
      error: error,
    );
  }
}
