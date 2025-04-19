import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'config/theme.dart';
import 'l10n/l10n.dart';
import 'routing/go_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: lightTheme(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => primaryFocus?.unfocus(),
          child: child,
        );
      },
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        final locale = basicLocaleListResolution(locales, supportedLocales);
        Intl.defaultLocale = locale.toString();
        return locale;
      },
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
