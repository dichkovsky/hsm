import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('ru')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Paradise Oracle'**
  String get appTitle;

  /// No description provided for @cards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cards;

  /// No description provided for @meditations.
  ///
  /// In en, this message translates to:
  /// **'Meditations'**
  String get meditations;

  /// No description provided for @manifestations.
  ///
  /// In en, this message translates to:
  /// **'Manifestations'**
  String get manifestations;

  /// No description provided for @getCards.
  ///
  /// In en, this message translates to:
  /// **'Get your deck'**
  String get getCards;

  /// No description provided for @getCardsSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have your cards deck yet? Get it here!'**
  String get getCardsSubTitle;

  /// No description provided for @cardOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Card of the day'**
  String get cardOfTheDay;

  /// No description provided for @cardOfTheDayDesc.
  ///
  /// In en, this message translates to:
  /// **'Get unique card reading daily'**
  String get cardOfTheDayDesc;

  /// No description provided for @timeTillNextCard.
  ///
  /// In en, this message translates to:
  /// **'Next card in {hr} hours and {min} minutes'**
  String timeTillNextCard(Object hr, Object min);

  /// No description provided for @randomCard.
  ///
  /// In en, this message translates to:
  /// **'Random Card'**
  String get randomCard;

  /// No description provided for @randomCardDesc.
  ///
  /// In en, this message translates to:
  /// **'Get random card reading.'**
  String get randomCardDesc;

  /// No description provided for @randomCardDrawsLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No more draws left for today.} =1{1 draw left today.} other{{count} draws left today.}}'**
  String randomCardDrawsLeft(num count);

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General meaning'**
  String get general;

  /// No description provided for @visualization.
  ///
  /// In en, this message translates to:
  /// **'Visualization'**
  String get visualization;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get relationship;

  /// No description provided for @workFinance.
  ///
  /// In en, this message translates to:
  /// **'Work and Finance'**
  String get workFinance;

  /// No description provided for @cardsGallery.
  ///
  /// In en, this message translates to:
  /// **'Cards Gallery'**
  String get cardsGallery;

  /// No description provided for @cardsGalleryDesc.
  ///
  /// In en, this message translates to:
  /// **'Explore all the cards in our hand-crafted cards deck'**
  String get cardsGalleryDesc;

  /// No description provided for @cardsSwiper.
  ///
  /// In en, this message translates to:
  /// **'Cards Swiper'**
  String get cardsSwiper;

  /// No description provided for @cardsSwiperDesc.
  ///
  /// In en, this message translates to:
  /// **'Explore the cards by swiping them one by one'**
  String get cardsSwiperDesc;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account settings'**
  String get accountSettings;

  /// No description provided for @appTheme.
  ///
  /// In en, this message translates to:
  /// **'Application theme'**
  String get appTheme;

  /// No description provided for @appThemeType.
  ///
  /// In en, this message translates to:
  /// **'{themeType, select, light{Light} dark{Dark} other{System}}'**
  String appThemeType(String themeType);

  /// No description provided for @appLang.
  ///
  /// In en, this message translates to:
  /// **'Application Language'**
  String get appLang;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoonTitle;

  /// No description provided for @comingSoonMsg.
  ///
  /// In en, this message translates to:
  /// **'We are working hard to update the application with more exciting features. Keep an eye on app updates!'**
  String get comingSoonMsg;

  /// No description provided for @limitedAvalibilityNotice.
  ///
  /// In en, this message translates to:
  /// **'Content is not available. Click for details.'**
  String get limitedAvalibilityNotice;

  /// No description provided for @limitedAvalibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Access restriction'**
  String get limitedAvalibilityTitle;

  /// No description provided for @limitedAvalibilityMsg.
  ///
  /// In en, this message translates to:
  /// **'This text is available only in the Card of the Day screen. Soon we will introduce an option to unblock it. Stay tuned for the application updates!'**
  String get limitedAvalibilityMsg;

  /// No description provided for @randonLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'No more draws today'**
  String get randonLimitTitle;

  /// No description provided for @randomLimitMsg.
  ///
  /// In en, this message translates to:
  /// **'Your are out of the random card draws for today. Wait for tomorrow to get 3 more draws.'**
  String get randomLimitMsg;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get commonRegister;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @seekForward.
  ///
  /// In en, this message translates to:
  /// **'5 sec'**
  String get seekForward;

  /// No description provided for @seekBack.
  ///
  /// In en, this message translates to:
  /// **'-5 sec'**
  String get seekBack;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
