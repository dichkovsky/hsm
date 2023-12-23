import 'package:hsm/src/common_widgets/ui_card.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardsHomeScreen extends StatelessWidget {
  const CardsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        padding: const EdgeInsets.all(Sizes.p8),
        children: [
          UICard(
            height: Sizes.p104,
            title: context.loc.randomCard,
            titleColor: Theme.of(context).colorScheme.background,
            bgColor: Theme.of(context).colorScheme.primary,
            subTitle: context.loc.randomCardDesc,
            subTitleColor: Theme.of(context).colorScheme.background,
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
