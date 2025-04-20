import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'config/theme.dart';
import 'l10n/l10n.dart';
import 'presentation/mixin/loading_state.dart';
import 'routing/go_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: lightTheme(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        final locale = basicLocaleListResolution(locales, supportedLocales);
        Intl.defaultLocale = locale.toString();
        return locale;
      },
      routerConfig: ref.watch(goRouterProvider),
      builder: (context, child) {
        final isLoading = ref.watch(loadingStateProvider);
        return GestureDetector(
          onTap: () => primaryFocus?.unfocus(),
          child: Stack(
            children: [
              child!,
              if (isLoading)
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withValues(alpha: 0.7),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        );
      },
    );
  }
}
