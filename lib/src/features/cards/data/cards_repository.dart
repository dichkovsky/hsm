import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_repository.g.dart';

class CardsRepository {
//  final FirebaseFirestore _firestore;
  final Ref ref;

  const CardsRepository(/* this._firestore,  */this.ref);

  /* Query<HSMCard> _cardsQuery() {
    final lang = ref.read(appLocaleProvider).languageCode;
    return _firestore
      .collection('cards').doc(lang).collection('${lang}_cards')
      .withConverter(
        fromFirestore: (doc, _) => HSMCard.fromMap(doc.data()!),
        toFirestore: (HSMCard card, options) => card.toMap(),
      );
  } */
  
  Future<List<HSMCard>> fetchCardsList() async {
    // TODO: implement fetchCard
    throw UnimplementedError();
    /* final query = _cardsQuery();
    final snapshot = await query.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(); */
  }

  Stream<List<HSMCard>> watchCardsList() {
    // TODO: implement fetchCard
    throw UnimplementedError();
   /*  final query = _cardsQuery();
    return query.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList()); */
  }

  Future<HSMCard?> fetchCard(HSMCardID id) async {
    // TODO: implement fetchCard
    throw UnimplementedError();
  }

  Stream<HSMCard?> watchCard(HSMCardID id) {
    // TODO: implement watchCard
    throw UnimplementedError();
  }

  Future<List<HSMCard>> search(String query) async {
    // TODO: implement search
    throw UnimplementedError();
  }

}


@Riverpod(keepAlive: true)
CardsRepository cardsRepository(CardsRepositoryRef ref) {
  return CardsRepository(/* FirebaseFirestore.instance,  */ref);
} 


@riverpod
Future<List<HSMCard>> cardsListFuture(CardsListFutureRef ref) {
  final cardsRepository = ref.watch(cardsRepositoryProvider);
  return cardsRepository.fetchCardsList();
}