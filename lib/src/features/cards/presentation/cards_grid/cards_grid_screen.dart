import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/data/cards_repository.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:hsm/src/features/cards/presentation/widgets/card_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/localization/string_hardcoded.dart';
import 'package:hsm/src/system/routing/app_router.dart';

class CardsGridScreen extends ConsumerWidget {
  const CardsGridScreen({super.key, this.onPressed});
  final void Function(BuildContext, HSMCardID)? onPressed;

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

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.cardsGallery),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, constraints) {

        if (cards.isEmpty) {
          return Center(child: Text(
            "No Cards Found".hardcoded
          ));
        }

        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final aspect = width/height;

        final crossAxisCount = aspect < 1 ? 2 : 5;
        return GridView.builder(
          itemCount: cards.length,
          padding: const EdgeInsets.fromLTRB(Sizes.p12, 0, Sizes.p12, Sizes.p12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: Sizes.p8,
            mainAxisSpacing: Sizes.p8,
            childAspectRatio: CardFace.cardAspect,
          ),
          itemBuilder: (context, index) {
            final card = cards[index];
            return Hero(
              tag: "card${card.id}",
              child: CardFace(
                card: card,
                onPressed: () => context.goNamed(
                  AppRoutes.cardsGalleryCardDetails.name,
                  pathParameters: {'id': card.id},
                ),
              ),
            );
          },
        );
      })
    );
  }
}