import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/cards/presentation/widgets/card_face.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

mixin BaseCardViewMixin {

  static const animationDuration = Duration(seconds: 1);

  AppBar getScreenAppBar(String title, HSMCard card, BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  Widget getCardScreen(String title, HSMCard card, BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: getScreenAppBar(title, card, context, ref),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final aspect = width/height;

          var descriptionColumn = buildDescriptionColumn(aspect, card, context, ref);

          var cardDisplay = buildCardDisplay(true, card, context, ref);

          if (aspect > 1) {
            // Landscape
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(Sizes.p24, Sizes.p16, Sizes.p24, Sizes.p16),
                  child: cardDisplay,
                ),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView(
                      children: [Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, Sizes.p16, Sizes.p16),
                        child: descriptionColumn,
                      )],
                    ),
                  )
                )
              ],
            );
          }

          // Portrait
          return Scrollbar(
            thumbVisibility: true,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(Sizes.p16, 0, Sizes.p16, Sizes.p16),
              child: ListView(
                clipBehavior: Clip.none,
                children: [
                  cardDisplay,
                  descriptionColumn,
                ],
              ),
            ),
          );
        },
      ).animate(onPlay: (_) => playSound(card) )
    );
  }

  Center buildCardDisplay(bool animate, HSMCard card, BuildContext context, WidgetRef ref) {
    final hero = Hero(
      tag: "card${card.id}",
      child: CardFace(card: card),
    );

    return Center(child: animate ? hero.animate().fadeIn(duration: animationDuration, curve: Curves.ease).scale() : hero);
  }

  Column buildDescriptionColumn(double aspect, HSMCard card, BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Sizes.p16),
        Text(card.description),
        const SizedBox(height: Sizes.p12),
        Text(context.loc.general, style: Theme.of(context).textTheme.titleLarge),
        Text(card.general),
        const SizedBox(height: Sizes.p12),
        Text(context.loc.visualization, style: Theme.of(context).textTheme.titleLarge),
        Text(card.visualization),
        const SizedBox(height: Sizes.p12),
        Text(context.loc.health, style: Theme.of(context).textTheme.titleLarge),
        Text(card.health),
        const SizedBox(height: Sizes.p12),
        Text(context.loc.relationship, style: Theme.of(context).textTheme.titleLarge),
        Text(card.relationship),
        const SizedBox(height: Sizes.p12),
        Text(context.loc.workFinance, style: Theme.of(context).textTheme.titleLarge),
        Text(card.workFinance),
      ],
    );
  }

  void playSound(HSMCard card) {
    if (card.soundURL.isNotEmpty) {
      final player = AudioPlayer();
      player.play(UrlSource(card.soundURL));
    }
  }
}