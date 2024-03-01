import 'package:hive_flutter/adapters.dart';
import 'package:hsm/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:hsm/src/features/cards/application/card_of_the_day_service.dart';
import 'package:hsm/src/features/cards/application/random_card_service.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/system/exceptions/error_logger.dart';
import 'package:hsm/src/system/localization/string_hardcoded.dart';

/// Helper class to initialize services and configure the error handlers
abstract class AppBootstrap {
  /// Create the root widget that should be passed to [runApp].
  UncontrolledProviderScope createRootWidget({required ProviderContainer container}) {
    // * Initialize CartSyncService to start the listener
    //container.read(cartSyncServiceProvider);
    
    // * Initialize UserTokenRefreshService
    //container.read(userTokenRefreshServiceProvider);

    // * Register error handlers. For more info, see:
    // * https://docs.flutter.dev/testing/errors
    final errorLogger = container.read(errorLoggerProvider);
    registerErrorHandlers(errorLogger);

    registerLocalStorrage();

    initState(container);

    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }

  // Register Flutter error handlers
  void registerErrorHandlers(ErrorLogger errorLogger) {
    // * Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };
    // * Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };
    // * Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }

  void registerLocalStorrage() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HSMCardAdapter());
    Hive.registerAdapter(MeditationAdapter());
  }

  void initState(ProviderContainer container) {
    container.read(randomCardServiceProvider).clearStorredData();
    container.read(randomCardServiceProvider).getDrawsLeft();
    //container.read(cardOfTheDayServiceProvider).clearStorredData();
    container.read(cardOfTheDayServiceProvider).checkCardOfTheDay();
  }

  Future<ProviderContainer> initContainer({bool addDelay = true}) async {
    throw UnimplementedError("Need to implement initContainer method in subcalss");
  }
}