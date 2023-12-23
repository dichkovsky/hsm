import 'package:hsm/src/features/cards/data/cards_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_controller.g.dart';

@riverpod
class CardsController extends _$CardsController {

  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> getCards() async {
    final cardsRepo = ref.read(cardsRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cardsRepo.fetchCardsList());
  }

}