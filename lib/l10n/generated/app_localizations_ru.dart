import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'HSM Оракул';

  @override
  String get cards => 'Карты';

  @override
  String get meditations => 'Медитации';

  @override
  String get manifestations => 'Манифестации';

  @override
  String get randomCard => 'Случайная карта';

  @override
  String get randomCardDesc => 'Получите чтение для случайной карты из колоды';

  @override
  String get general => 'Общее значение';

  @override
  String get visualization => 'Визуализация';

  @override
  String get health => 'Здоровье';

  @override
  String get relationship => 'Взаимоотношения';

  @override
  String get workFinance => 'Работа и Финансы';

  @override
  String get cardsGallery => 'Галерея карт';

  @override
  String get cardsGalleryDesc => 'Изучите карты в нашей созданной вручную колоде карт';

  @override
  String get cardsSwiper => 'Листайте карты';

  @override
  String get cardsSwiperDesc => 'Исследуйте карты, листая их одну за другой';

  @override
  String get accountSettings => 'Настройки аккаунта';

  @override
  String get appTheme => 'Тема оформления';

  @override
  String appThemeType(String themeType) {
    String _temp0 = intl.Intl.selectLogic(
      themeType,
      {
        'light': 'Светлая',
        'dark': 'Темная',
        'other': 'Авто',
      },
    );
    return '$_temp0';
  }

  @override
  String get appLang => 'Язык приложения';
}
