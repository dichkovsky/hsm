import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/features/cards/application/random_card_service.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/cards/presentation/widgets/base_card_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

class RandomCardScreen extends ConsumerWidget with BaseCardViewMixin {
  const RandomCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cardFuture = ref.watch(fetchNextRandomCardFutureProvider);

    return cardFuture.when(
      data: (HSMCard? card) => getCardScreen(context.loc.randomCard, card!, context, ref), 
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString()))
    );
  }
}