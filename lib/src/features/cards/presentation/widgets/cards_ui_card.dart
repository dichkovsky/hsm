import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/common_widgets/ui_card.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/application/card_of_the_day_service.dart';
import 'package:hsm/src/features/cards/application/random_card_service.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';

enum CardsUICardType {
  cardOfTheDay,
  randomCard,
  swiper,
  gallery
}

class CardsUICrad extends ConsumerWidget {

  final CardsUICardType type;

  const CardsUICrad(this.type, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (type) {
      case CardsUICardType.cardOfTheDay:
        final lastCardOfTheDay = ref.watch(lastCardOfTheDayProvider);
        var isCardOrTheDayAvailable = false;
        var cardOfTheDayImg = 'assets/elements/CardOfTheDay.png';
        if (lastCardOfTheDay == null) {
          isCardOrTheDayAvailable = true;
        } else {
          cardOfTheDayImg = lastCardOfTheDay.faceURL;
        }
        return UICard(
          height: Sizes.p104,
          title: context.loc.cardOfTheDay,
          titleColor: isCardOrTheDayAvailable ? Theme.of(context).colorScheme.background : null,
          bgColor: isCardOrTheDayAvailable ? Theme.of(context).colorScheme.primary : null,
          subTitle: context.loc.cardOfTheDayDesc,
          subTitleColor: isCardOrTheDayAvailable ? Theme.of(context).colorScheme.background : null,
          bgImage: cardOfTheDayImg,
          needsDecor: !isCardOrTheDayAvailable,
          onTap: () {
            context.goNamed(AppRoutes.cardOfTheDay.name);
          },
        );

      case CardsUICardType.randomCard:
        final randomCardsLeft = ref.watch(randomCardsDrawsLeftProvider);
        var randomCardSubtitle = context.loc.randomCardDesc;
        if (randomCardsLeft >= 0) {
          randomCardSubtitle = "$randomCardSubtitle ${context.loc.randomCardDrawsLeft(randomCardsLeft)}";
        }
        return UICard(
          height: Sizes.p104,
          title: context.loc.randomCard,
          subTitle: randomCardSubtitle,
          bgImage: 'assets/elements/CardOfTheDay.png',
          onTap: () {
            context.goNamed(AppRoutes.randomCard.name);
          },
        );

      case CardsUICardType.swiper:
        return UICard(
          height: Sizes.p104,
          title: context.loc.cardsSwiper,
          subTitle: context.loc.cardsSwiperDesc,
          bgImage: 'assets/elements/CardOfTheDay.png',
          onTap: () {
            context.goNamed(AppRoutes.cardsSwiper.name);
          },
        );

      case CardsUICardType.gallery:
        return UICard(
          height: Sizes.p104,
          title: context.loc.cardsGallery,
          subTitle: context.loc.cardsGalleryDesc,
          bgImage: 'assets/elements/CardsDeck.png',
          onTap: () {
            context.goNamed(AppRoutes.cardsGallery.name);
          },
        );
        
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
  
}