import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/app_bootstrap.dart';
import 'package:hsm/src/features/cards/data/cards_repository_appwrite.dart';
import 'package:hsm/src/features/cards/data/cards_repository_firebase.dart';
import 'package:hsm/src/features/cards/data/cards_repository_fake.dart';
import 'package:hsm/src/system/exceptions/async_error_logger.dart';

class AppBootstrapFakes extends AppBootstrap {
  @override
  Future<ProviderContainer> initContainer({bool addDelay = true}) async {

    final cardsRepositoryFake = CardsRepositoryFake(addDelay: addDelay);

    return ProviderContainer(
      overrides: [
        // repositories
        cardsRepositoryFirebaseProvider.overrideWithValue(cardsRepositoryFake),
        cardsRepositoryAppwriteProvider.overrideWithValue(cardsRepositoryFake),
        // services
        //checkoutServiceProvider.overrideWithValue(checkoutService),
      ],
      observers: [AsyncErrorLogger()],
    );
  }
}