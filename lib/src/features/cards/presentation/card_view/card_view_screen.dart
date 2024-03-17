import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/features/authentification/application/account_service.dart';
import 'package:hsm/src/features/cards/application/cards_service.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/cards/presentation/widgets/base_card_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CardViewScreen extends ConsumerWidget with BaseCardViewMixin {
  CardViewScreen({required this.cardId, super.key});

  final HSMCardID cardId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cardFuture = ref.watch(cardFutureProvider(cardId));

    return cardFuture.when(
      data: (HSMCard? card) {
        final isPrem = ref.watch(isPremiumProvider);
        return getCardScreen(card!.title, card, isPrem, context, ref, animate: false);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString()))
    );
  }
}