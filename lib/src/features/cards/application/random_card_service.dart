import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/cards/data/cards_repository_firebase.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/system/exceptions/app_exception.dart';
import 'package:hsm/src/system/preferences/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_card_service.g.dart';

@riverpod
RandomCardService randomCardService(RandomCardServiceRef ref) {
  return RandomCardService(ref);
}

@riverpod
Future<HSMCard?> fetchNextRandomCardFuture(FetchNextRandomCardFutureRef ref) {
  final randomCardService = ref.watch(randomCardServiceProvider);
  return randomCardService.fetchNextRandomCard();
}


@Riverpod(keepAlive: true)
class RandomCardsDrawsLeft extends _$RandomCardsDrawsLeft {

  @override
  int build() {
    return -1;
  }

  int updateCount(int val) {
    state = val;
    return val;
  }
}


class RandomCardService {
  
  RandomCardService(this.ref);
  final Ref ref;

  static const firstDrawDateKey = 'RandomCard.firstDrawDateKey';
  static const randomCardsKey = 'RandomCard.randomCardsKey';

  // TODO: get this value from firebase configuration
  static const maxDailyCards = 3;
  // TODO: get this value from the user account
  static const isPrem = false;

  Future<int> getDrawsLeft() async {
    final drawsLeftNotivier = ref.read(randomCardsDrawsLeftProvider.notifier);
    var drawsLeft = -1;
    if (!isPrem) {
      final pref = ref.read(preferencesRepositoryProvider);
      final firstDrawDateVal = await pref.fetchInt(firstDrawDateKey);
      final firstDrawDate = DateTime.fromMicrosecondsSinceEpoch(firstDrawDateVal);
      var randomCardsCount = await pref.fetchInt(randomCardsKey);
      final currentDateTime = DateTime.now();
      final hoursDif = currentDateTime.difference(firstDrawDate).inHours;
      if (firstDrawDateVal == 0 || hoursDif >=24 || firstDrawDate.day != currentDateTime.day) {
        await pref.setInt(firstDrawDateKey, currentDateTime.microsecondsSinceEpoch);
        randomCardsCount = 0;
        await pref.setInt(randomCardsKey, randomCardsCount);
      } 
      drawsLeft = drawsLeftNotivier.updateCount(maxDailyCards - randomCardsCount);
    }
    return drawsLeft;
  }

  Future<HSMCard?> fetchNextRandomCard() async {
    
    final drawsLeft = await getDrawsLeft();
    
    if (isPrem || drawsLeft > 0) {
      final cardsRemoteRepo = ref.read(cardsRepositoryFirebaseProvider);
      final ftr = cardsRemoteRepo.fetchRandomCard();
      ftr.then((HSMCard? card) {
        if ((card != null) && (! isPrem)) {
            final pref = ref.read(preferencesRepositoryProvider);
            pref.setInt(randomCardsKey, maxDailyCards - drawsLeft + 1);
            ref.read(randomCardsDrawsLeftProvider.notifier).updateCount(drawsLeft - 1);
        }
      });
      return ftr;
    } else {
      return Future.error('No more card draws allowed!');
    }
  }

  void clearStorredData() {
    final pref = ref.read(preferencesRepositoryProvider);
    pref.clearKey(firstDrawDateKey);
    pref.clearKey(randomCardsKey);
  }

}