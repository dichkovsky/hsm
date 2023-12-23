import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/app_bootstrap.dart';
import 'package:hsm/src/system/exceptions/async_error_logger.dart';

class AppBootstrapAppwrite extends AppBootstrap {
  @override
  Future<ProviderContainer> initContainer({bool addDelay = true}) async {
    return ProviderContainer(
      overrides: [
        // repositories
        //reviewsRepositoryProvider.overrideWithValue(reviewsRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
  }
}