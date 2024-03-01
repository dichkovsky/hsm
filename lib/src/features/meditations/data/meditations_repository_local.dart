import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hsm/src/features/meditations/data/meditations_repository_base.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditations_repository_local.g.dart';

class MeditationsRepositoryLocal implements MeditationsRepositoryBase {

  static const meditationsBoxKey = 'meditations';

  final Ref ref;

  MeditationsRepositoryLocal(this.ref) {
    ref.listen(appLocaleStrProvider, (previous, next) {
      if (previous != null && previous != next) clearStorrage();
    });
  }

  Future<void> clearStorrage() {
    return Hive.deleteBoxFromDisk(meditationsBoxKey);
  }

  @override
  Future<Meditation?> fetchMeditation(MeditationID id) async {
    final meditationsBox = await Hive.openBox(meditationsBoxKey);
    Meditation meditation = meditationsBox.get(id);
    return Future.value(meditation);
  }

  @override
  Future<List<Meditation>> fetchMeditationsList(String lang) async {
    final meditationsBox = await Hive.openBox(meditationsBoxKey);
    List<Meditation> l = List.empty(growable: true);
    for (var meditation in meditationsBox.values) {
      if (meditation is Meditation) {
        l.add(meditation);
      }
    }
    l.sort(((a, b) => a.id.compareTo(b.id)));
    return Future.value(l);
  }

  Future<bool> hasLocalMeditations() {
    return Hive.boxExists(meditationsBoxKey);
  }

  writeLocalMeditations(List<Meditation> meditations) async {
    final meditationsBox = await Hive.openBox(meditationsBoxKey);
    for (var meditation in meditations) {
      await meditationsBox.put(meditation.id, meditation);
    }
  }
}

@Riverpod(keepAlive: true)
MeditationsRepositoryLocal meditationsRepositoryLocal(MeditationsRepositoryLocalRef ref) {
  return MeditationsRepositoryLocal(ref);
} 