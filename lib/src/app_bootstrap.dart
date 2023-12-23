import 'package:hsm/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
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

  Future<ProviderContainer> initContainer({bool addDelay = true}) async {
    throw UnimplementedError("Need to implement initContainer method in subcalss");
  }
}