import 'package:flutter/material.dart';
import 'package:hsm/src/system/exceptions/app_exception.dart';
import 'package:hsm/src/system/preferences/preferences_repository.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale_provider.g.dart';

enum SupportedLanguages {
  english("English", "en"),
  russian("Русский", "ru"),
  /* german("Deutsche", "de"),
  spanish("Español", "es") */;

  const SupportedLanguages(this.label, this.isoCode);
  final String label;
  final String isoCode;
}

@Riverpod(keepAlive: true)
class AppLocaleStr extends _$AppLocaleStr {

  static const localeKey = 'locale';
  
  @override
  String build() {
    final sysLocale = Intl.getCurrentLocale().split('_')[0];
    final appLocaleAsyncValue = ref.read(preferencesFetchStringFutureProvider(localeKey, defaultVal: sysLocale));
    return appLocaleAsyncValue.value?? sysLocale;
  }

  update(String val) {
    state = val;
  }

  List<Locale> getSupportedLocales() {
    return SupportedLanguages.values.map((e) => Locale(e.isoCode)).toList();
  }

  Locale getCurrentLocale() {
    return Locale.fromSubtags(languageCode: state);
  }
}

@riverpod
class AppLocale extends _$AppLocale {

  static const localeKey = 'locale';
  
  @override
  Locale build() {
    final sysLocale = Intl.getCurrentLocale().split('_')[0];
    final appLocaleAsyncValue = ref.watch(preferencesFetchStringFutureProvider(localeKey, defaultVal: sysLocale));
    return Locale.fromSubtags(languageCode: appLocaleAsyncValue.value?? sysLocale);
  }

  void update(String value) async {
    final preferencesRepository = ref.read(preferencesRepositoryProvider);
    final isUpdated = await preferencesRepository.setString(localeKey, value);
    if (isUpdated) {
      state = Locale.fromSubtags(languageCode:value);
      ref.read(appLocaleStrProvider.notifier).update(value);
    } else {
      throw LocalStorrageSaveException();
    }
  }

  List<Locale> getSupportedLocales() {
    return SupportedLanguages.values.map((e) => Locale(e.isoCode)).toList();
  }
}