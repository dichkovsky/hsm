import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/cards/data/cards_repository_base.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:hsm/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:hsm/src/features/cards/data/test_cards.dart';


part 'cards_repository_firebase.g.dart';

class CardsRepositoryFirebase implements CardsRepositoryBase {
  final Ref ref;
  final FirebaseFirestore _firestore;

  const CardsRepositoryFirebase(this.ref, this._firestore);

  Query<HSMCard> _cardsQuery() {
    final lang = ref.read(appLocaleProvider).languageCode;
    return _firestore
      .collection('cards_$lang').withConverter(
        fromFirestore: (doc, _) => HSMCard.fromMap(doc.data()!),
        toFirestore: (HSMCard card, options) => card.toMap(),
      ).orderBy('cardNo');
  }
  
  Future<List<HSMCard>> fetchCardsList() async {
    final query = _cardsQuery();
    final snapshot = await query.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  Future<HSMCard?> fetchCard(HSMCardID id) async {
    // TODO: implement fetchCard
    throw UnimplementedError();
  }

  /* 
  Future<void> _addCard(HSMCard card, lang) {
    return _firestore.collection('cards_$lang').doc(card.id).set(card.toMap());
  }
  addCards() async {
    final lang = ref.read(appLocaleProvider).languageCode;
    final cards = InMemoryStore<List<HSMCard>>(List.from(kTestCards)).value;
    for (var card in cards) {
      await _addCard(card, lang);
    }
  }
  */

}

@Riverpod(keepAlive: true)
CardsRepositoryFirebase cardsRepositoryFirebase(CardsRepositoryFirebaseRef ref) {
  return CardsRepositoryFirebase(ref, FirebaseFirestore.instance);
} 