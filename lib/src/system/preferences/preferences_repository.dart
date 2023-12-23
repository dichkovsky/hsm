import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_repository.g.dart';

class PreferencesRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> fetchString(String key, {String defaultVal = ''}) async {
    final SharedPreferences prefs = await _prefs;
    final String value = prefs.getString(key)?? defaultVal;
    return value;
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

}

@riverpod
PreferencesRepository preferencesRepository(PreferencesRepositoryRef ref) {
  return PreferencesRepository();
}

@riverpod
Future<String> preferencesFetchStringFuture(PreferencesFetchStringFutureRef ref, String key, {String defaultVal = ''}) {
  final preferencesRepository = ref.watch(preferencesRepositoryProvider);
  return preferencesRepository.fetchString(key, defaultVal: defaultVal);
}