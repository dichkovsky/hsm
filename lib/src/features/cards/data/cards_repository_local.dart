import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hsm/src/features/cards/data/cards_repository_base.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_repository_local.g.dart';

class CardsRepositoryLocal implements CardsRepositoryBase {

  static const cardsBoxKey = 'cards';

  final Ref ref;

  final Future<Box<dynamic>> _cardsBox = Hive.openBox(cardsBoxKey);

  CardsRepositoryLocal(this.ref);

  Future<void> clearStorrage() {
    return Hive.deleteBoxFromDisk(cardsBoxKey);
  }

  Future<HSMCard?> fetchRandomCard() async {
    final cardsBox = await _cardsBox;
    var cards = cardsBox.values;
    final index = Random().nextInt(cards.length-1);
    return Future.value(cardsBox.getAt(index));
  }

  @override
  Future<HSMCard?> fetchCard(HSMCardID id) async {
    final cardsBox = await _cardsBox;
    HSMCard card = cardsBox.get(id);
    return Future.value(card);
  }

  @override
  Future<List<HSMCard>> fetchCardsList() async {
    final cardsBox = await _cardsBox;
    List<HSMCard> l = List.empty(growable: true);
    for (var card in cardsBox.values) {
      if (card is HSMCard) {
        l.add(card);
      }
    }
    l.sort(((a, b) => a.cardNo.compareTo(b.cardNo)));
    return Future.value(l);
  }

  Future<bool> hasLocalCards() {
    return Hive.boxExists(cardsBoxKey);
  }

  writeLocalCards(List<HSMCard> cards) async {
    final cardsBox = await _cardsBox;
    for (var card in cards) {
      await cardsBox.put(card.id, card);
    }
  }
}

@Riverpod(keepAlive: true)
CardsRepositoryLocal cardsRepositoryLocal(CardsRepositoryLocalRef ref) {
  return CardsRepositoryLocal(ref);
} 