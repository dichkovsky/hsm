import 'package:flutter/material.dart';
import 'package:hsm/src/system/exceptions/app_exception.dart';
import 'package:hsm/src/system/preferences/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

@riverpod
class AppTheme extends _$AppTheme {

  static const appThemeKey = 'appTheme';
  static const systemThemeName = 'system';
  
  @override
  ThemeMode build() {
    final appThemeAsyncValue = ref.watch(preferencesFetchStringFutureProvider(appThemeKey, defaultVal: systemThemeName));
    return ThemeMode.values.byName(appThemeAsyncValue.value?? systemThemeName);
  }

  Future<void> update(ThemeMode value) async {
    final preferencesRepository = ref.read(preferencesRepositoryProvider);
    final isUpdated = await preferencesRepository.setString(appThemeKey, value.name);
    if (isUpdated) {
      state = value;
    } else {
      throw LocalStorrageSaveException();
    }
  }
}


const appLightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF8C00E6),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFF1DAFF),
  onPrimaryContainer: Color.fromARGB(255, 49, 14, 75),
  secondary: Color(0xFF395BA9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDAE2FF),
  onSecondaryContainer: Color(0xFF001947),
  tertiary: Color(0xFF964900),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDCC7),
  onTertiaryContainer: Color(0xFF311300),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1D1B1E),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1D1B1E),
  surfaceVariant: Color(0xFFE9DFEA),
  onSurfaceVariant: Color(0xFF4B454D),
  outline: Color(0xFF7C757E),
  onInverseSurface: Color(0xFFF6EFF3),
  inverseSurface: Color(0xFF322F33),
  inversePrimary: Color(0xFFDFB7FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF8C00E6),
  outlineVariant: Color(0xFFCDC4CE),
  scrim: Color(0xFF000000),
);

const appDarkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFDFB7FF),
  onPrimary: Color(0xFF4B007E),
  primaryContainer: Color(0xFF6A00B0),
  onPrimaryContainer: Color(0xFFF1DAFF),
  secondary: Color(0xFFB1C5FF),
  onSecondary: Color(0xFF002C71),
  secondaryContainer: Color(0xFF1D438F),
  onSecondaryContainer: Color(0xFFDAE2FF),
  tertiary: Color(0xFFFFB787),
  onTertiary: Color(0xFF512400),
  tertiaryContainer: Color(0xFF723600),
  onTertiaryContainer: Color(0xFFFFDCC7),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1D1B1E),
  onBackground: Color(0xFFE7E1E5),
  surface: Color(0xFF1D1B1E),
  onSurface: Color(0xFFE7E1E5),
  surfaceVariant: Color(0xFF4B454D),
  onSurfaceVariant: Color(0xFFCDC4CE),
  outline: Color(0xFF968E98),
  onInverseSurface: Color(0xFF1D1B1E),
  inverseSurface: Color(0xFFE7E1E5),
  inversePrimary: Color(0xFF8C00E6),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFDFB7FF),
  outlineVariant: Color(0xFF4B454D),
  scrim: Color(0xFF000000),
);
