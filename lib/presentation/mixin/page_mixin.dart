import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/exception/app_exception.dart';
import 'loading_state.dart';

mixin PageMixin {
  Future<void> execute(
    BuildContext context,
    WidgetRef ref, {
    bool showLoading = true,
    required AsyncCallback action,
    AsyncCallback? onComplete,
    Future<void> Function(AppException)? onExceptionCatch,
  }) async {
    try {
      if (showLoading) {
        ref.read(loadingStateProvider.notifier).startLoading();
      }

      await action();

      if (showLoading) {
        ref.read(loadingStateProvider.notifier).endLoading();
      }

      await onComplete?.call();
    } on AppException catch (e) {
      if (showLoading) {
        ref.read(loadingStateProvider.notifier).endLoading();
      }

      if (onExceptionCatch != null) {
        await onExceptionCatch(e);
      }
    }
  }
}
