import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => '[ES] HSM Oracle';

  @override
  String get cards => 'Cards';

  @override
  String get meditations => 'Meditations';

  @override
  String get manifestations => 'Manifestations';

  @override
  String get randomCard => '[ES] Random Card';

  @override
  String get randomCardDesc => '[ES] Get random card reading';

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
  String get accountSettings => '[ES] Account settings';

  @override
  String get appTheme => '[ES] Application theme';

  @override
  String appThemeType(String themeType) {
    String _temp0 = intl.Intl.selectLogic(
      themeType,
      {
        'light': '[ES] Light',
        'dark': '[ES] Dark',
        'other': '[ES] System',
      },
    );
    return '$_temp0';
  }

  @override
  String get appLang => '[ES] Application Language';
}
