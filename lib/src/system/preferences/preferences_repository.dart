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


  Future<int> fetchInt(String key, {int defaultVal = 0}) async {
    final SharedPreferences prefs = await _prefs;
    final int value = prefs.getInt(key)?? defaultVal;
    return value;
  }

  Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }


  Future<List<String>?> fetchStringList(String key) async {
    final SharedPreferences prefs = await _prefs;
    final List<String>? value = prefs.getStringList(key);
    return value;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setStringList(key, value);
  }



  Future<bool> clearKey(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
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