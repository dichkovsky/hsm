import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/app_bootstrap_appwrite.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';


part 'cards_repository.g.dart';

class Failure {
  final String message;
  final StackTrace stackTrace;

  const Failure(this.message, this.stackTrace);
}

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
typedef FutureVoid = Future<void>;

/* abstract class ICardsAPI {
  Future<List<HSMCard>> getCards(String lang);
}

final cardsAPIProvider = Provider(
  (ref) => CardsAPI(
    db: ref.watch(appwriteDatabasesProvider)
  ),
);
class CardsAPI implements ICardsAPI {
  final Databases _db;

  CardsAPI({required Databases db}) : _db = db;
  
  @override
  Future<List<HSMCard>> getCards(String lang) async {
    String collectionId = AppwriteConstant.cardsLangCollections.lookup(lang).getOrElse(() => AppwriteConstant.cardsEnId);
    final documentsList = await _db.listDocuments(databaseId: AppwriteConstant.databaseId, collectionId: collectionId);
    final documents = documentsList.documents.map((card) => HSMCard.fromMap(card.data)).toList();
    return documents;
  }
} */

class CardsRepository {
  final Ref ref;

  const CardsRepository(this.ref);

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
    final lang = ref.read(appLocaleProvider).languageCode;
    final db = ref.read(appwriteDatabasesProvider);
    String collectionId = AppwriteConstant.cardsLangCollections.lookup(lang).getOrElse(() => AppwriteConstant.cardsEnId);
    final documentsList = await db.listDocuments(databaseId: AppwriteConstant.databaseId, collectionId: collectionId, queries: [
      Query.orderAsc("cardNo"),
      Query.limit(100)
    ]);
    final cards = documentsList.documents.map((card) => HSMCard.fromMap(card.data)).toList();
    return cards;
    // TODO: implement fetchCard
    //throw UnimplementedError();
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