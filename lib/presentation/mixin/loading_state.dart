import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_state.g.dart';

@riverpod
class LoadingState extends _$LoadingState {
  @override
  bool build() => false;

  void startLoading() => state = true;

  void endLoading() => state = false;
}
