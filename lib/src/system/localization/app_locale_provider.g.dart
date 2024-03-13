// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appLocaleStrHash() => r'a1daac4191198a74c1b45be67bc0a9c20ca7415d';

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
String _$appLocaleHash() => r'92530c1514c1512ab33c51f2b0b2ca16087049a4';

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
