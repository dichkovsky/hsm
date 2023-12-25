import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/app_bootstrap.dart';
import 'package:appwrite/appwrite.dart';
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

class AppwriteConstant {
  static const projectID = '6563e9d4dfa31b278b89';
  static const endPoint = 'https://cloud.appwrite.io/v1';
  static const databaseId = '6563ec19163d0a3ab3db';
  static const Map<String, String> cardsLangCollections = {
    'ru':'6563ec50550ca4f9fba1',
    'en':'65870d6e0111bb5c5e0a'
  };
  static const cardsRuId = '6563ec50550ca4f9fba1';
  static const cardsEnId = '65870d6e0111bb5c5e0a';
}

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstant.endPoint)
      .setProject(AppwriteConstant.projectID)
      .setSelfSigned();
});

final appwriteAccountProvider = Provider((ref) {
  return Account(ref.watch(appwriteClientProvider));
});

final appwriteDatabasesProvider = Provider((ref) {
  return Databases(ref.watch(appwriteClientProvider));
});

final appwriteStorageProvider = Provider((ref) {
  return Storage(ref.watch(appwriteClientProvider));
});

final appwriteRealtimeProvider = Provider((ref) {
  return Realtime(ref.watch(appwriteClientProvider));
});