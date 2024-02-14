// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardsServiceHash() => r'c3234830eda738338daf963f8819ab2306402b5a';

/// See also [cardsService].
@ProviderFor(cardsService)
final cardsServiceProvider = AutoDisposeProvider<CardsService>.internal(
  cardsService,
  name: r'cardsServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cardsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardsServiceRef = AutoDisposeProviderRef<CardsService>;
String _$cardsListFutureHash() => r'428446909792b71f78636edc5f31f2a917355deb';

/// See also [cardsListFuture].
@ProviderFor(cardsListFuture)
final cardsListFutureProvider =
    AutoDisposeFutureProvider<List<HSMCard>>.internal(
  cardsListFuture,
  name: r'cardsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardsListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardsListFutureRef = AutoDisposeFutureProviderRef<List<HSMCard>>;
String _$cardFutureHash() => r'564ea88c64b6738f3c03cbb20468d0a73c75d61c';

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

/// See also [cardFuture].
@ProviderFor(cardFuture)
const cardFutureProvider = CardFutureFamily();

/// See also [cardFuture].
class CardFutureFamily extends Family<AsyncValue<HSMCard?>> {
  /// See also [cardFuture].
  const CardFutureFamily();

  /// See also [cardFuture].
  CardFutureProvider call(
    String id,
  ) {
    return CardFutureProvider(
      id,
    );
  }

  @override
  CardFutureProvider getProviderOverride(
    covariant CardFutureProvider provider,
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
  String? get name => r'cardFutureProvider';
}

/// See also [cardFuture].
class CardFutureProvider extends AutoDisposeFutureProvider<HSMCard?> {
  /// See also [cardFuture].
  CardFutureProvider(
    String id,
  ) : this._internal(
          (ref) => cardFuture(
            ref as CardFutureRef,
            id,
          ),
          from: cardFutureProvider,
          name: r'cardFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cardFutureHash,
          dependencies: CardFutureFamily._dependencies,
          allTransitiveDependencies:
              CardFutureFamily._allTransitiveDependencies,
          id: id,
        );

  CardFutureProvider._internal(
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
    FutureOr<HSMCard?> Function(CardFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CardFutureProvider._internal(
        (ref) => create(ref as CardFutureRef),
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
  AutoDisposeFutureProviderElement<HSMCard?> createElement() {
    return _CardFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CardFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CardFutureRef on AutoDisposeFutureProviderRef<HSMCard?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CardFutureProviderElement
    extends AutoDisposeFutureProviderElement<HSMCard?> with CardFutureRef {
  _CardFutureProviderElement(super.provider);

  @override
  String get id => (origin as CardFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
