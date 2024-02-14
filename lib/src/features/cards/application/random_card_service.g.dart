// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_card_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomCardServiceHash() => r'214d45977347f86ac57bf292ba4eb0463dced1df';

/// See also [randomCardService].
@ProviderFor(randomCardService)
final randomCardServiceProvider =
    AutoDisposeProvider<RandomCardService>.internal(
  randomCardService,
  name: r'randomCardServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomCardServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RandomCardServiceRef = AutoDisposeProviderRef<RandomCardService>;
String _$fetchNextRandomCardFutureHash() =>
    r'9fba3673c8fd97b299dacd9a0f5349b47b7e88ff';

/// See also [fetchNextRandomCardFuture].
@ProviderFor(fetchNextRandomCardFuture)
final fetchNextRandomCardFutureProvider =
    AutoDisposeFutureProvider<HSMCard?>.internal(
  fetchNextRandomCardFuture,
  name: r'fetchNextRandomCardFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchNextRandomCardFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchNextRandomCardFutureRef = AutoDisposeFutureProviderRef<HSMCard?>;
String _$randomCardsDrawsLeftHash() =>
    r'ad35a35e6827a951b5810dcb20badab7b14f25ac';

/// See also [RandomCardsDrawsLeft].
@ProviderFor(RandomCardsDrawsLeft)
final randomCardsDrawsLeftProvider =
    NotifierProvider<RandomCardsDrawsLeft, int>.internal(
  RandomCardsDrawsLeft.new,
  name: r'randomCardsDrawsLeftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomCardsDrawsLeftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RandomCardsDrawsLeft = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
