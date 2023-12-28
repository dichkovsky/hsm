import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/cards/data/cards_repository_appwrite.dart';
import 'package:hsm/src/features/cards/data/cards_repository_firebase.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_service.g.dart';

class CardsService {
  CardsService(this.ref);
  final Ref ref;

  Future<List<HSMCard>> fetchCardsList() async {
    final cardsRemoteRepo = ref.read(cardsRepositoryFirebaseProvider);
    return cardsRemoteRepo.fetchCardsList();
  }

}

@riverpod
CardsService cardsService(CardsServiceRef ref) {
  return CardsService(ref);
}

@riverpod
Future<List<HSMCard>> cardsListFuture(CardsListFutureRef ref) {
  final cardsService = ref.watch(cardsServiceProvider);
  return cardsService.fetchCardsList();
}