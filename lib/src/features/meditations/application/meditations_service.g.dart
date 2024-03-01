// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditations_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$meditationsServiceHash() =>
    r'bdfbb23b2b45ea0e9bf67a22b44d4a31dc560ca3';

/// See also [meditationsService].
@ProviderFor(meditationsService)
final meditationsServiceProvider =
    AutoDisposeProvider<MeditationsService>.internal(
  meditationsService,
  name: r'meditationsServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$meditationsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MeditationsServiceRef = AutoDisposeProviderRef<MeditationsService>;
String _$meditationsListFutureHash() =>
    r'e357c0321fd17a122c31112931d64a691539715e';

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

/// See also [meditationsListFuture].
@ProviderFor(meditationsListFuture)
const meditationsListFutureProvider = MeditationsListFutureFamily();

/// See also [meditationsListFuture].
class MeditationsListFutureFamily extends Family<AsyncValue<List<Meditation>>> {
  /// See also [meditationsListFuture].
  const MeditationsListFutureFamily();

  /// See also [meditationsListFuture].
  MeditationsListFutureProvider call(
    String lang,
  ) {
    return MeditationsListFutureProvider(
      lang,
    );
  }

  @override
  MeditationsListFutureProvider getProviderOverride(
    covariant MeditationsListFutureProvider provider,
  ) {
    return call(
      provider.lang,
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
  String? get name => r'meditationsListFutureProvider';
}

/// See also [meditationsListFuture].
class MeditationsListFutureProvider
    extends AutoDisposeFutureProvider<List<Meditation>> {
  /// See also [meditationsListFuture].
  MeditationsListFutureProvider(
    String lang,
  ) : this._internal(
          (ref) => meditationsListFuture(
            ref as MeditationsListFutureRef,
            lang,
          ),
          from: meditationsListFutureProvider,
          name: r'meditationsListFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$meditationsListFutureHash,
          dependencies: MeditationsListFutureFamily._dependencies,
          allTransitiveDependencies:
              MeditationsListFutureFamily._allTransitiveDependencies,
          lang: lang,
        );

  MeditationsListFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lang,
  }) : super.internal();

  final String lang;

  @override
  Override overrideWith(
    FutureOr<List<Meditation>> Function(MeditationsListFutureRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MeditationsListFutureProvider._internal(
        (ref) => create(ref as MeditationsListFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lang: lang,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Meditation>> createElement() {
    return _MeditationsListFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MeditationsListFutureProvider && other.lang == lang;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lang.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MeditationsListFutureRef
    on AutoDisposeFutureProviderRef<List<Meditation>> {
  /// The parameter `lang` of this provider.
  String get lang;
}

class _MeditationsListFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<Meditation>>
    with MeditationsListFutureRef {
  _MeditationsListFutureProviderElement(super.provider);

  @override
  String get lang => (origin as MeditationsListFutureProvider).lang;
}

String _$meditationFutureHash() => r'be77a6ac7ce2da80430c5191e90c521f5a76c55f';

/// See also [meditationFuture].
@ProviderFor(meditationFuture)
const meditationFutureProvider = MeditationFutureFamily();

/// See also [meditationFuture].
class MeditationFutureFamily extends Family<AsyncValue<Meditation?>> {
  /// See also [meditationFuture].
  const MeditationFutureFamily();

  /// See also [meditationFuture].
  MeditationFutureProvider call(
    String id,
  ) {
    return MeditationFutureProvider(
      id,
    );
  }

  @override
  MeditationFutureProvider getProviderOverride(
    covariant MeditationFutureProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'meditationFutureProvider';
}

/// See also [meditationFuture].
class MeditationFutureProvider extends AutoDisposeFutureProvider<Meditation?> {
  /// See also [meditationFuture].
  MeditationFutureProvider(
    String id,
  ) : this._internal(
          (ref) => meditationFuture(
            ref as MeditationFutureRef,
            id,
          ),
          from: meditationFutureProvider,
          name: r'meditationFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$meditationFutureHash,
          dependencies: MeditationFutureFamily._dependencies,
          allTransitiveDependencies:
              MeditationFutureFamily._allTransitiveDependencies,
          id: id,
        );

  MeditationFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Meditation?> Function(MeditationFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MeditationFutureProvider._internal(
        (ref) => create(ref as MeditationFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Meditation?> createElement() {
    return _MeditationFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MeditationFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MeditationFutureRef on AutoDisposeFutureProviderRef<Meditation?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MeditationFutureProviderElement
    extends AutoDisposeFutureProviderElement<Meditation?>
    with MeditationFutureRef {
  _MeditationFutureProviderElement(super.provider);

  @override
  String get id => (origin as MeditationFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
