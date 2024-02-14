import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/app_bootstrap_appwrite.dart';
import 'package:hsm/src/features/cards/data/cards_repository_base.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fpdart/fpdart.dart';


part 'cards_repository_appwrite.g.dart';

class Failure {
  final String message;
  final StackTrace stackTrace;

  const Failure(this.message, this.stackTrace);
}

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
typedef FutureVoid = Future<void>;

class CardsRepositoryAppwrite implements CardsRepositoryBase {
  final Ref ref;

  const CardsRepositoryAppwrite(this.ref);
  
  @override
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
  }
  
  @override
  Future<HSMCard?> fetchCard(HSMCardID id) {
    // TODO: implement fetchCard
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
CardsRepositoryAppwrite cardsRepositoryAppwrite(CardsRepositoryAppwriteRef ref) {
  return CardsRepositoryAppwrite(ref);
}