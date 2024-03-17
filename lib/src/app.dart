import 'package:hsm/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/preferences/app_theme.dart';
import 'package:hsm/src/system/routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final appTheme = ref.watch(appThemeProvider);
    final appLocale = ref.watch(appLocaleProvider);

    bool isDarkMode = (appTheme == ThemeMode.system) ? MediaQuery.of(context).platformBrightness == Brightness.dark : appTheme == ThemeMode.dark;

    TextTheme appTextTheme = getTextTheme(isDarkMode, context);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, textTheme: appTextTheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme, textTheme: appTextTheme),
      themeMode: appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: ref.read(appLocaleProvider.notifier).getSupportedLocales(),
      locale: appLocale,  
    );
  }
}