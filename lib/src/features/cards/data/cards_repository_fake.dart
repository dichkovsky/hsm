import 'dart:math';

import 'package:hsm/src/features/cards/data/cards_repository_appwrite.dart';
import 'package:hsm/src/features/cards/data/cards_repository_firebase.dart';
import 'package:hsm/src/features/cards/data/test_cards.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/utils/in_memory_store.dart';
import 'package:riverpod/src/framework.dart';

class CardsRepositoryFake implements CardsRepositoryFirebase, CardsRepositoryAppwrite {
  final bool addDelay;

  final _cards = InMemoryStore<List<HSMCard>>(List.from(kTestCards));

  CardsRepositoryFake({required this.addDelay});

  // Retrieve the cards list as a [Future] (one-time read)
  @override
  Future<List<HSMCard>> fetchCardsList() async {
    return Future.value(_cards.value);
  }

  // Retrieve a specific card by ID
  @override
  Future<HSMCard?> fetchCard(HSMCardID id) async {
    return Future.value(_getCard(_cards.value, id));
  }

  @override
  Future<HSMCard?> fetchRandomCard() {
    final rand = Random().nextInt(55) + 1;
    return fetchCard('card$rand');
  }

  static HSMCard? _getCard(List<HSMCard> cards, String id) {
    // * This can also be implemented with [firstWhereOrNull] from this package:
    // * https://api.flutter.dev/flutter/package-collection_collection/IterableExtension/firstWhereOrNull.html
    try {
      return cards.firstWhere((card) => card.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  // TODO: implement ref
  Ref<Object?> get ref => throw UnimplementedError();
  
  // addCards() {
  //   // TODO: implement addCards
  //   throw UnimplementedError();
  // }

}