import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/cards/data/cards_repository_firebase.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/system/preferences/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_of_the_day_service.g.dart';

@Riverpod(keepAlive: true)
class CardOfTheDayHoursLeft extends _$CardOfTheDayHoursLeft {

  @override
  Duration build() {
    return Duration.zero;
  }

  Duration updateCount(Duration val) {
    state = val;
    return val;
  }
}

@Riverpod(keepAlive: true)
class LastCardOfTheDay extends _$LastCardOfTheDay {
 
  @override
  HSMCard? build() {
    return null;
  }

  HSMCard? updateCard(HSMCard? card) {
    state = card;
    return card;
  }

}

@riverpod
CardOfTheDayService cardOfTheDayService(CardOfTheDayServiceRef ref) {
  return CardOfTheDayService(ref);
}

@riverpod
Future<HSMCard?> fetchCardOfTheDayFuture(FetchCardOfTheDayFutureRef ref) {
  final cardOfTheDayService = ref.watch(cardOfTheDayServiceProvider);
  return cardOfTheDayService.fetchCardOfTheDay();
}

class CardOfTheDayService {
  
  CardOfTheDayService(this.ref);
  final Ref ref;

  static const lastDrawDateKey = 'CardOfTheDay.lastDrawDate';
  static const lastDrawCardKey = 'CardOfTheDay.lastDrawCard';

  Future<HSMCard?> fetchCardOfTheDay() async {
    final cardsRemoteRepo = ref.read(cardsRepositoryFirebaseProvider);
    final pref = ref.read(preferencesRepositoryProvider);
    final lastDrawDateVal = await pref.fetchInt(lastDrawDateKey);
    final lastDrawDate = DateTime.fromMicrosecondsSinceEpoch(lastDrawDateVal);
    final lastDrawCard = await pref.fetchString(lastDrawCardKey);
    final currentDateTime = DateTime.now();
    final hoursDif = currentDateTime.difference(lastDrawDate).inHours;

    if (lastDrawDateVal == 0 || lastDrawCard == '' || hoursDif >=24 || lastDrawDate.day != currentDateTime.day) {
      final ftr = cardsRemoteRepo.fetchRandomCard();
      ftr.then((HSMCard? card) {
        if (card != null) {
          pref.setInt(lastDrawDateKey, currentDateTime.microsecondsSinceEpoch);
          pref.setString(lastDrawCardKey, card.id);
          ref.read(lastCardOfTheDayProvider.notifier).updateCard(card);
        }
      });
      return ftr;
    } else {
      final ftr = cardsRemoteRepo.fetchCard(lastDrawCard);
      ftr.then((HSMCard? card) {
        if (card != null) {
          ref.read(lastCardOfTheDayProvider.notifier).updateCard(card);
        }
      });
      return ftr;
    }
  }

  Future<HSMCard?> checkCardOfTheDay() async {
    final cardsRemoteRepo = ref.read(cardsRepositoryFirebaseProvider);
    final pref = ref.read(preferencesRepositoryProvider);
    final lastDrawDateVal = await pref.fetchInt(lastDrawDateKey);
    final lastDrawDate = DateTime.fromMicrosecondsSinceEpoch(lastDrawDateVal);
    final lastDrawCard = await pref.fetchString(lastDrawCardKey);
    final currentDateTime = DateTime.now();
    final hoursDif = currentDateTime.difference(lastDrawDate).inHours;

    if (lastDrawDateVal == 0 || lastDrawCard == '' || hoursDif >=24 || lastDrawDate.day != currentDateTime.day) {
      return null;
    } else {
      final ftr = cardsRemoteRepo.fetchCard(lastDrawCard);
      ftr.then((HSMCard? card) {
        if (card != null) {
          ref.read(lastCardOfTheDayProvider.notifier).updateCard(card);
        }
      });
      return ftr;
    }
  }


  Future<Duration> getHoursLeft() async {
    final pref = ref.read(preferencesRepositoryProvider);
    final lastDrawDateVal = await pref.fetchInt(lastDrawDateKey);
    final lastDrawDate = DateTime.fromMicrosecondsSinceEpoch(lastDrawDateVal);
    final lastDrawCard = await pref.fetchString(lastDrawCardKey);
    final currentDateTime = DateTime.now();
    final hoursDif = currentDateTime.difference(lastDrawDate).inHours;

    if (lastDrawDateVal == 0 || lastDrawCard == '' || hoursDif >=24 || lastDrawDate.day != currentDateTime.day) {
      return ref.read(cardOfTheDayHoursLeftProvider.notifier).updateCount(Duration.zero);
    } else {
      final hr = 23 - DateTime.now().hour;
      final min = 59 - DateTime.now().minute;
      return ref.read(cardOfTheDayHoursLeftProvider.notifier).updateCount(Duration(hours: hr, minutes: min));
    }
  }

  void clearStorredData() {
    final pref = ref.read(preferencesRepositoryProvider);
    pref.clearKey(lastDrawCardKey);
    pref.clearKey(lastDrawDateKey);
  }

}