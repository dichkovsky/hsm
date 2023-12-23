// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$preferencesRepositoryHash() =>
    r'181079df52432df434cca7032ebdc396eebc222d';

/// See also [preferencesRepository].
@ProviderFor(preferencesRepository)
final preferencesRepositoryProvider =
    AutoDisposeProvider<PreferencesRepository>.internal(
  preferencesRepository,
  name: r'preferencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$preferencesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PreferencesRepositoryRef
    = AutoDisposeProviderRef<PreferencesRepository>;
String _$preferencesFetchStringFutureHash() =>
    r'ecb049f722d480f0458deb123a64bc6850b25492';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [preferencesFetchStringFuture].
@ProviderFor(preferencesFetchStringFuture)
const preferencesFetchStringFutureProvider =
    PreferencesFetchStringFutureFamily();

/// See also [preferencesFetchStringFuture].
class PreferencesFetchStringFutureFamily extends Family<AsyncValue<String>> {
  /// See also [preferencesFetchStringFuture].
  const PreferencesFetchStringFutureFamily();

  /// See also [preferencesFetchStringFuture].
  PreferencesFetchStringFutureProvider call(
    String key, {
    String defaultVal = '',
  }) {
    return PreferencesFetchStringFutureProvider(
      key,
      defaultVal: defaultVal,
    );
  }

  @override
  PreferencesFetchStringFutureProvider getProviderOverride(
    covariant PreferencesFetchStringFutureProvider provider,
  ) {
    return call(
      provider.key,
      defaultVal: provider.defaultVal,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'preferencesFetchStringFutureProvider';
}

/// See also [preferencesFetchStringFuture].
class PreferencesFetchStringFutureProvider
    extends AutoDisposeFutureProvider<String> {
  /// See also [preferencesFetchStringFuture].
  PreferencesFetchStringFutureProvider(
    String key, {
    String defaultVal = '',
  }) : this._internal(
          (ref) => preferencesFetchStringFuture(
            ref as PreferencesFetchStringFutureRef,
            key,
            defaultVal: defaultVal,
          ),
          from: preferencesFetchStringFutureProvider,
          name: r'preferencesFetchStringFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$preferencesFetchStringFutureHash,
          dependencies: PreferencesFetchStringFutureFamily._dependencies,
          allTransitiveDependencies:
              PreferencesFetchStringFutureFamily._allTransitiveDependencies,
          key: key,
          defaultVal: defaultVal,
        );

  PreferencesFetchStringFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
    required this.defaultVal,
  }) : super.internal();

  final String key;
  final String defaultVal;

  @override
  Override overrideWith(
    FutureOr<String> Function(PreferencesFetchStringFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PreferencesFetchStringFutureProvider._internal(
        (ref) => create(ref as PreferencesFetchStringFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
        defaultVal: defaultVal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _PreferencesFetchStringFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PreferencesFetchStringFutureProvider &&
        other.key == key &&
        other.defaultVal == defaultVal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);
    hash = _SystemHash.combine(hash, defaultVal.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PreferencesFetchStringFutureRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `key` of this provider.
  String get key;

  /// The parameter `defaultVal` of this provider.
  String get defaultVal;
}

class _PreferencesFetchStringFutureProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with PreferencesFetchStringFutureRef {
  _PreferencesFetchStringFutureProviderElement(super.provider);

  @override
  String get key => (origin as PreferencesFetchStringFutureProvider).key;
  @override
  String get defaultVal =>
      (origin as PreferencesFetchStringFutureProvider).defaultVal;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
