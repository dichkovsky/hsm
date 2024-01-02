import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/application/cards_service.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/cards/presentation/widgets/card_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

class CardViewScreen extends ConsumerWidget {
  const CardViewScreen({this.cardId, super.key});

  final HSMCardID? cardId;

  final animationDuration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cardsListValue = ref.watch(cardsListFutureProvider);

    final error = cardsListValue.error;
    if (error != null) {
      return Center(child: ErrorMessageWidget(error.toString()));
    }
    // * The previous value will be returned while loading
    final cards = cardsListValue.value;
    // * As a result, we only show the loading indicator if the value is null
    if (cards == null) {
      return const Center(child: CircularProgressIndicator());
    }
    
    final index = isRandomCard ? 
      Random().nextInt(cards.length-1) : 
      cards.indexWhere((element) => element.id == cardId);

    final HSMCard card = cards[index];

    final title = isRandomCard ?
      "${context.loc.randomCard} - ${card.title}" :
      card.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final aspect = width/height;

          var descriptionColumn = _buildDescriptionColumn(aspect, card, context);

          var cardDisplay = _buildCardDisplay(card, isRandomCard);

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

  bool get isRandomCard => cardId == null;

  Center _buildCardDisplay(HSMCard card, bool animate) {
    final hero = Hero(
      tag: "card${card.id}",
      child: CardFace(card: card),
    );

    return Center(child: animate ? hero.animate().fadeIn(duration: animationDuration, curve: Curves.ease).scale() : hero);
  }

  Column _buildDescriptionColumn(double aspect, HSMCard card, BuildContext context) {
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