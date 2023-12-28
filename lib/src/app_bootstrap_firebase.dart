
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/firebase_options.dart';
import 'package:hsm/src/app_bootstrap.dart';
import 'package:hsm/src/system/exceptions/async_error_logger.dart';

class AppBootstrapFirebase extends AppBootstrap {
  @override
  Future<ProviderContainer> initContainer({bool addDelay = true}) async {

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return ProviderContainer(
      overrides: [
        // repositories
        //reviewsRepositoryProvider.overrideWithValue(reviewsRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
  }
}