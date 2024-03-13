// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$meditationServiceHash() => r'c5bc078d355d8b5fd013a5483f3dfe6548e55fb0';

/// See also [meditationService].
@ProviderFor(meditationService)
final meditationServiceProvider = Provider<MeditationService>.internal(
  meditationService,
  name: r'meditationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$meditationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MeditationServiceRef = ProviderRef<MeditationService>;
String _$playerStateNotifierHash() =>
    r'c5bb1a2a9b8ba56d5567010e2c903e98b70bdce1';

/// See also [PlayerStateNotifier].
@ProviderFor(PlayerStateNotifier)
final playerStateNotifierProvider =
    NotifierProvider<PlayerStateNotifier, MeditationPlayerState>.internal(
  PlayerStateNotifier.new,
  name: r'playerStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerStateNotifier = Notifier<MeditationPlayerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
