import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => '[DE] HSM Oracle';

  @override
  String get cards => 'Cards';

  @override
  String get meditations => 'Meditations';

  @override
  String get manifestations => 'Manifestations';

  @override
  String get getCards => 'Get your deck';

  @override
  String get getCardsSubTitle => 'Don\'t have your cards deck yet? Get it here!';

  @override
  String get cardOfTheDay => 'Card of the day';

  @override
  String get cardOfTheDayDesc => 'Get unique card reading daily';

  @override
  String timeTillNextCard(Object hr, Object min) {
    return 'Next card in $hr hours and $min minutes';
  }

  @override
  String get randomCard => '[DE] Random Card';

  @override
  String get randomCardDesc => '[DE] Get random card reading';

  @override
  String randomCardDrawsLeft(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count draws left today.',
      one: '1 draw left today.',
      zero: 'No more draws left for today.',
    );
    return '$_temp0';
  }

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
  String get accountSettings => '[DE] Account settings';

  @override
  String get appTheme => '[DE] Application theme';

  @override
  String appThemeType(String themeType) {
    String _temp0 = intl.Intl.selectLogic(
      themeType,
      {
        'light': '[DE] Light',
        'dark': '[DE] Dark',
        'other': '[DE] System',
      },
    );
    return '$_temp0';
  }

  @override
  String get appLang => '[DE] Application Language';

  @override
  String get comingSoonTitle => 'Coming soon';

  @override
  String get comingSoonMsg => 'We are working hard to update the application with more exciting features. Keep an eye on app updates!';

  @override
  String get limitedAvalibilityNotice => 'Content is not available. Click for details.';

  @override
  String get limitedAvalibilityTitle => 'Access restriction';

  @override
  String get limitedAvalibilityMsg => 'This text is available only in the Card of the Day screen. Soon we will introduce an option to unblock it. Stay tuned for the application updates!';

  @override
  String get randonLimitTitle => 'No more draws today';

  @override
  String get randomLimitMsg => 'Your are out of the random card draws for today. Wait for tomorrow to get 3 more draws.';

  @override
  String get commonBack => 'Back';

  @override
  String get commonRegister => 'Register';

  @override
  String get play => 'Play';

  @override
  String get pause => 'Pause';

  @override
  String get seekForward => '5 sec';

  @override
  String get seekBack => '-5 sec';
}
