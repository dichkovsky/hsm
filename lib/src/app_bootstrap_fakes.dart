
import 'package:hsm/src/features/cards/data/cards_repository.dart';
import 'package:hsm/src/features/cards/data/fake_cards_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/exceptions/async_error_logger.dart';

import 'app_bootstrap.dart';

extension AppBootstrapFakes on AppBootstrap {

  Future<ProviderContainer> createFakesProviderContainer({bool addDelay = true}) async {
    final cardsRepository = FakeCardsRepository(addDelay: addDelay);

    return ProviderContainer(
      overrides: [
        // repositories
        cardsRepositoryProvider.overrideWithValue(cardsRepository),
        // services
        //checkoutServiceProvider.overrideWithValue(checkoutService),
      ],
      observers: [AsyncErrorLogger()],
    );
  }
}