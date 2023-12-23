// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardsRepositoryHash() => r'5c586adaab12a2bee93572a648297bb46c02e9f8';

/// See also [cardsRepository].
@ProviderFor(cardsRepository)
final cardsRepositoryProvider = Provider<CardsRepository>.internal(
  cardsRepository,
  name: r'cardsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardsRepositoryRef = ProviderRef<CardsRepository>;
String _$cardsListFutureHash() => r'8fc2498989f48847694a02ba7cb8f5b3c01f34c9';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
