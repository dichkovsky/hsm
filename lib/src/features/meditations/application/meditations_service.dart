import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/meditations/data/meditations_repository_firebase.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditations_service.g.dart'; 

@riverpod
MeditationsService meditationsService(MeditationsServiceRef ref) {
  return MeditationsService(ref);
}

@riverpod
Future<List<Meditation>> meditationsListFuture(MeditationsListFutureRef ref, String lang) {
  final meditationsService = ref.watch(meditationsServiceProvider);
  return meditationsService.fetchMeditationsList(lang);
}

@riverpod
Future<Meditation?> meditationFuture(MeditationFutureRef ref, MeditationID id) {
  final meditationsService = ref.watch(meditationsServiceProvider);
  return meditationsService.fetchMeditation(id);
}

class MeditationsService {
  MeditationsService(this.ref);
  final Ref ref;

  Future<Meditation?> fetchMeditation(MeditationID id) {
    final meditationsRemoteRepo = ref.read(meditationsRepositoryFirebaseProvider);
    return meditationsRemoteRepo.fetchMeditation(id);
  }

  Future<List<Meditation>> fetchMeditationsList(String lang) async {
    final meditationsRemoteRepo = ref.read(meditationsRepositoryFirebaseProvider);
    return meditationsRemoteRepo.fetchMeditationsList(lang);
  }

}