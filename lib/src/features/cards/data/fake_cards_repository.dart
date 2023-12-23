import 'package:hsm/src/features/cards/data/cards_repository.dart';
import 'package:hsm/src/features/cards/data/test_cards.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/utils/in_memory_store.dart';
import 'package:riverpod/src/framework.dart';

class FakeCardsRepository implements CardsRepository {
  final bool addDelay;

  final _cards = InMemoryStore<List<HSMCard>>(List.from(kTestCards));

  FakeCardsRepository({required this.addDelay});

  // Retrieve the cards list as a [Future] (one-time read)
  @override
  Future<List<HSMCard>> fetchCardsList() async {
    return Future.value(_cards.value);
  }

  // Retrieve the cards list as a [Stream] (for realtime updates)
  @override
  Stream<List<HSMCard>> watchCardsList() {
    return _cards.stream;
  }

  // Retrieve a specific card by ID
  @override
  Future<HSMCard?> fetchCard(HSMCardID id) async {
    return Future.value(_getCard(_cards.value, id));
  }

  // Retrieve a specific card by ID
  @override
  Stream<HSMCard?> watchCard(HSMCardID id) {
    return watchCardsList().map((cards) => _getCard(cards, id));
  }

  /// Search for cards where the title contains the search query
  @override
  Future<List<HSMCard>> search(String query) async {
    assert(
      _cards.value.length <= 100,
      'Client-side search should only be performed if the number of cards is small. '
      'Consider doing server-side search for larger datasets.',
    );
    // Get all cards
    final cardsList = await fetchCardsList();
    // Match all cards where the title contains the query
    return cardsList
        .where((card) =>
            card.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
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

}