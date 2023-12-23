import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'HSM Oracle';

  @override
  String get cards => 'Cards';

  @override
  String get meditations => 'Meditations';

  @override
  String get manifestations => 'Manifestations';

  @override
  String get randomCard => 'Random Card';

  @override
  String get randomCardDesc => 'Get random card reading';

  @override
  String get general => 'General meaning';

  @override
  String get visualization => 'Visualization';

  @override
  String get health => 'Health';

  @override
  String get relationship => 'Relationship';

  @override
  String get workFinance => 'Work and Finance';

  @override
  String get cardsGallery => 'Cards Gallery';

  @override
  String get cardsGalleryDesc => 'Explore all the cards in our hand-crafted cards deck';

  @override
  String get cardsSwiper => 'Cards Swiper';

  @override
  String get cardsSwiperDesc => 'Explore the cards by swiping them one by one';

  @override
  String get accountSettings => 'Account settings';

  @override
  String get appTheme => 'Application theme';

  @override
  String appThemeType(String themeType) {
    String _temp0 = intl.Intl.selectLogic(
      themeType,
      {
        'light': 'Light',
        'dark': 'Dark',
        'other': 'System',
      },
    );
    return '$_temp0';
  }

  @override
  String get appLang => 'Application Language';
}
