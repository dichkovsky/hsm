// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_of_the_day_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cardOfTheDayServiceHash() =>
    r'cad6f8eeb666a72993bdf17cfcaebceb13d7b934';

/// See also [cardOfTheDayService].
@ProviderFor(cardOfTheDayService)
final cardOfTheDayServiceProvider =
    AutoDisposeProvider<CardOfTheDayService>.internal(
  cardOfTheDayService,
  name: r'cardOfTheDayServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardOfTheDayServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CardOfTheDayServiceRef = AutoDisposeProviderRef<CardOfTheDayService>;
String _$fetchCardOfTheDayFutureHash() =>
    r'335a6c24c26649b84e878178420efc6435548366';

/// See also [fetchCardOfTheDayFuture].
@ProviderFor(fetchCardOfTheDayFuture)
final fetchCardOfTheDayFutureProvider =
    AutoDisposeFutureProvider<HSMCard?>.internal(
  fetchCardOfTheDayFuture,
  name: r'fetchCardOfTheDayFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCardOfTheDayFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCardOfTheDayFutureRef = AutoDisposeFutureProviderRef<HSMCard?>;
String _$cardOfTheDayHoursLeftHash() =>
    r'32c88c4e0d8b26ba48cca2157068912221a4e154';

/// See also [CardOfTheDayHoursLeft].
@ProviderFor(CardOfTheDayHoursLeft)
final cardOfTheDayHoursLeftProvider =
    NotifierProvider<CardOfTheDayHoursLeft, Duration>.internal(
  CardOfTheDayHoursLeft.new,
  name: r'cardOfTheDayHoursLeftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cardOfTheDayHoursLeftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CardOfTheDayHoursLeft = Notifier<Duration>;
String _$lastCardOfTheDayHash() => r'd59405458510cedc048605cffcc1b570b623b612';

/// See also [LastCardOfTheDay].
@ProviderFor(LastCardOfTheDay)
final lastCardOfTheDayProvider =
    NotifierProvider<LastCardOfTheDay, HSMCard?>.internal(
  LastCardOfTheDay.new,
  name: r'lastCardOfTheDayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastCardOfTheDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LastCardOfTheDay = Notifier<HSMCard?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
