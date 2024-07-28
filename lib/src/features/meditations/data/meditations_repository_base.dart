import 'package:hsm/src/features/meditations/domain/meditation.dart';

abstract class MeditationsRepositoryBase {
  Future<List<Meditation>> fetchMeditationsList(String lang);
  Future<Meditation?> fetchMeditation(String lang, MeditationID id);
}