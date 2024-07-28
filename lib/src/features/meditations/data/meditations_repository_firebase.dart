import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/meditations/data/meditations_repository_base.dart';
import 'package:hsm/src/features/meditations/data/meditations_repository_local.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditations_repository_firebase.g.dart';

@Riverpod(keepAlive: true)
MeditationsRepositoryFirebase meditationsRepositoryFirebase(MeditationsRepositoryFirebaseRef ref) {
  return MeditationsRepositoryFirebase(ref, FirebaseFirestore.instance);
}

class MeditationsRepositoryFirebase implements MeditationsRepositoryBase {
  final Ref ref;
  final FirebaseFirestore _firestore;

  const MeditationsRepositoryFirebase(this.ref, this._firestore);

  Query<Meditation> _meditationsQuery(String lang) {
    return _firestore
      .collection('meditations_$lang').withConverter(
        fromFirestore: (doc, _) => Meditation.fromMap(doc.data()!),
        toFirestore: (Meditation meditation, options) => meditation.toMap(),
      ).orderBy('id');
  }

  DocumentReference<Meditation> _meditationDocRef(MeditationID id) {
    final lang = ref.read(appLocaleStrProvider);
    return _firestore
      .collection('meditations_$lang').doc(id).withConverter(
        fromFirestore: (doc, _) => Meditation.fromMap(doc.data()!),
        toFirestore: (Meditation meditation, options) => meditation.toMap(),
      );
  }
  
  @override
  Future<Meditation?> fetchMeditation(String lang, MeditationID id) async {
//    final meditationsLocalRepo = ref.read(meditationsRepositoryLocalProvider);
//    if (await meditationsLocalRepo.hasLocalMeditations(lang)) {
//      return meditationsLocalRepo.fetchMeditation(lang, id);
//    } else {
      final docRef = _meditationDocRef(id);
      final snapshot = await docRef.get();
      return snapshot.data();
//    }
  }
  
  @override
  Future<List<Meditation>> fetchMeditationsList(String lang) async {
//    final meditationsLocalRepo = ref.read(meditationsRepositoryLocalProvider);
//    if (await meditationsLocalRepo.hasLocalMeditations(lang)) {
//      return meditationsLocalRepo.fetchMeditationsList(lang);
//    } else {
      final query = _meditationsQuery(lang);
      final snapshot = await query.get();
      final meditations = snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
//      if (meditations.isNotEmpty) meditationsLocalRepo.writeLocalMeditations(lang, meditations);
      return meditations;
//    }
  }
}