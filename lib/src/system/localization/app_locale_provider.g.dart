// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLocaleStrHash() => r'88f7630ec8ff3f77f4ff1a918981c7a8ecbf0559';

/// See also [AppLocaleStr].
@ProviderFor(AppLocaleStr)
final appLocaleStrProvider = NotifierProvider<AppLocaleStr, String>.internal(
  AppLocaleStr.new,
  name: r'appLocaleStrProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appLocaleStrHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppLocaleStr = Notifier<String>;
String _$appLocaleHash() => r'e5e2862076e5a103e70d2ed4e9587ac96a8c7bdf';

/// See also [AppLocale].
@ProviderFor(AppLocale)
final appLocaleProvider =
    AutoDisposeNotifierProvider<AppLocale, Locale>.internal(
  AppLocale.new,
  name: r'appLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppLocale = AutoDisposeNotifier<Locale>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
