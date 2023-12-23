import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/preferences/app_theme.dart';

enum AppTheme {
  system("other", Icons.hdr_auto_outlined, ThemeMode.system), 
  light("light", Icons.light_mode_outlined, ThemeMode.light), 
  dark("dark", Icons.dark_mode_outlined, ThemeMode.dark);

  const AppTheme(this.label, this.icon, this.mode);
  final String label;
  final IconData icon;
  final ThemeMode mode;
}

class AccountScreen extends ConsumerWidget {

  const AccountScreen({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLocale = ref.watch(appLocaleProvider);
    final lang = SupportedLanguages.values.firstWhere((element) => element.isoCode == appLocale.languageCode, orElse: () => SupportedLanguages.english ); 

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accountSettings),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            Column(
              children: [
                Text(context.loc.appTheme),
                const SizedBox.square(dimension: Sizes.p16),
                SegmentedButton<AppTheme>(
                  selected: <AppTheme>{AppTheme.values.firstWhere((element) => element.mode == ref.watch(appThemeProvider), orElse: () => AppTheme.system )},
                  segments: _appThemeLine(context),
                  onSelectionChanged: (Set<AppTheme> newSelection) => ref.read(appThemeProvider.notifier).update(newSelection.first.mode),
                )
              ],
            ),
            const Divider(height: Sizes.p40),
            Column(
              children: [
                Text(context.loc.appLang),
                const SizedBox.square(dimension: Sizes.p16),
                DropdownMenu<SupportedLanguages>(
                  initialSelection: lang,
                  dropdownMenuEntries: _appLangLine(),
                  onSelected: (value) {
                    ref.read(appLocaleProvider.notifier).update(value!.isoCode);
                  },
                )
              ],
            ),
          ],
        )
      ),
    );
  }

  List<ButtonSegment<AppTheme>> _appThemeLine(BuildContext context) {
    final List<ButtonSegment<AppTheme>> appThemeEntries = <ButtonSegment<AppTheme>>[];
    for (final AppTheme theme in AppTheme.values) {
      appThemeEntries.add(
        ButtonSegment<AppTheme>(
          value: theme, 
          label: Text(context.loc.appThemeType(theme.label)), 
          icon: Icon(theme.icon)
        )
      );
    }
    return appThemeEntries;
  }

  List<DropdownMenuEntry<SupportedLanguages>> _appLangLine() {
    final List<DropdownMenuEntry<SupportedLanguages>> appLangEntries = <DropdownMenuEntry<SupportedLanguages>>[];
    for (final SupportedLanguages lang in SupportedLanguages.values) {
      appLangEntries.add(
        DropdownMenuEntry<SupportedLanguages>(
          value: lang, 
          label: lang.label,
        )
      );
    }
    return appLangEntries;
  }
}