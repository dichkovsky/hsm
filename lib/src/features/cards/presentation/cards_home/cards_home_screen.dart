import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/common_widgets/ui_card.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/application/card_of_the_day_service.dart';
import 'package:hsm/src/features/cards/application/random_card_service.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardsHomeScreen extends ConsumerWidget {
  const CardsHomeScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomCardsLeft = ref.watch(randomCardsDrawsLeftProvider);

    var randomCardSubtitle = context.loc.randomCardDesc;
    if (randomCardsLeft >= 0) {
      randomCardSubtitle = "$randomCardSubtitle ${context.loc.randomCardDrawsLeft(randomCardsLeft)}";
    }

    final lastCardOfTheDay = ref.watch(lastCardOfTheDayProvider);
    var isCardOrTheDayAvailable = false;
    var cardOfTheDayImg = 'assets/elements/CardOfTheDay.png';
    if (lastCardOfTheDay == null) {
      isCardOrTheDayAvailable = true;
    } else {
      cardOfTheDayImg = lastCardOfTheDay.faceURL;
    }

    return Container(
      alignment: Alignment.center,
      child: ListView(
        padding: const EdgeInsets.all(Sizes.p8),
        children: [
          UICard(
            height: Sizes.p104,
            title: context.loc.cardOfTheDay,
            titleColor: isCardOrTheDayAvailable ? Theme.of(context).colorScheme.background : null,
            bgColor: isCardOrTheDayAvailable ? Theme.of(context).colorScheme.primary : null,
            subTitle: context.loc.cardOfTheDayDesc,
            subTitleColor: isCardOrTheDayAvailable ? Theme.of(context).colorScheme.background : null,
            bgImage: cardOfTheDayImg,
            onTap: () {
              context.goNamed(AppRoutes.cardOfTheDay.name);
            },
          ),
          UICard(
            height: Sizes.p104,
            title: context.loc.randomCard,
            subTitle: randomCardSubtitle,
            bgImage: 'assets/elements/CardOfTheDay.png',
            onTap: () {
              context.goNamed(AppRoutes.randomCard.name);
            },
          ),
          UICard(
            height: Sizes.p104,
            title: context.loc.cardsGallery,
            subTitle: context.loc.cardsGalleryDesc,
            bgImage: 'assets/elements/CardsDeck.png',
            onTap: () {
              context.goNamed(AppRoutes.cardsGallery.name);
            },
          ),
          UICard(
            height: Sizes.p104,
            title: context.loc.cardsSwiper,
            subTitle: context.loc.cardsSwiperDesc,
            bgImage: 'assets/elements/CardOfTheDay.png',
            onTap: () {
              context.goNamed(AppRoutes.cardsSwiper.name);
            },
          ),
        ],
      ),
    );
  }
}
