import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Оракул Рай на Земле';

  @override
  String get cards => 'Карты';

  @override
  String get meditations => 'Медитации';

  @override
  String get manifestations => 'Манифестации';

  @override
  String get getCards => 'Купить карты';

  @override
  String get getCardsSubTitle => 'У вас еще нет своей колоды? Вам сюда!';

  @override
  String get cardOfTheDay => 'Карта дня';

  @override
  String get cardOfTheDayDesc => 'Вытяните счастливую карту раз в день';

  @override
  String timeTillNextCard(Object hr, Object min) {
    return 'Следующая карта через $hr часов $min минут';
  }

  @override
  String get randomCard => 'Случайная карта';

  @override
  String get randomCardDesc => 'Получите чтение случайной карты.';

  @override
  String randomCardDrawsLeft(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Осталось $count карт сегодня.',
      few: 'Осталось $count карты сегодня.',
      one: 'Осталась 1 карта сегодня.',
      zero: 'Осталось 0 карт сегодня.',
    );
    return '$_temp0';
  }

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

  @override
  String get comingSoonTitle => 'Скоро';

  @override
  String get comingSoonMsg => 'Мы усердно работаем над обновлением приложения и добавлением новых увлекательных функций. Следите за обновлениями приложения!';

  @override
  String get limitedAvalibilityNotice => 'Контент недоступен. Кликните, чтобы узнать подробности.';

  @override
  String get limitedAvalibilityTitle => 'Ограничение доступа';

  @override
  String get limitedAvalibilityMsg => 'Этот текст доступен только на экране \'Карта Дня\'. Скоро мы представим возможность разблокировать его и тут. Следите за обновлениями приложения!';

  @override
  String get randonLimitTitle => 'Сегодня попытки закончились';

  @override
  String get randomLimitMsg => 'У вас закончились попытки вытянуть случайные карты на сегодня. Подождите до завтра, чтобы получить еще 3 попытки.';

  @override
  String get commonBack => 'Вернуться';

  @override
  String get commonRegister => 'Зарегистрироваться';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get seekForward => '5 сек';

  @override
  String get seekBack => '-5 сек';
}
