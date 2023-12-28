import 'package:hsm/src/features/cards/domain/hsm_card.dart';

abstract class CardsRepositoryBase {
  Future<List<HSMCard>> fetchCardsList();
  Future<HSMCard?> fetchCard(HSMCardID id);
}