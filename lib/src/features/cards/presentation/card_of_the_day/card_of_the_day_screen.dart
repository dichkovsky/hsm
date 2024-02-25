import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/features/cards/application/card_of_the_day_service.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/cards/presentation/widgets/base_card_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';



class CardOfTheDayScreen extends ConsumerWidget with BaseCardViewMixin {
  const CardOfTheDayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cardFuture = ref.watch(fetchCardOfTheDayFutureProvider);

    return cardFuture.when(
      data: (HSMCard? card) => getCardScreen(card!.title, card, false, context, ref), 
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString()))
    );
  }

  @override
  AppBar getScreenAppBar(String title, HSMCard card, BuildContext context, WidgetRef ref) {
    final title = context.loc.cardOfTheDay;
    final hr = 23 - DateTime.now().hour;
    final min = 59 - DateTime.now().minute;
    return AppBar(
      title: Column(
        children: [
          Text(title),
          Text(context.loc.timeTillNextCard(hr, min), style: Theme.of(context).textTheme.labelSmall)
        ],
      )
    );
  }

}