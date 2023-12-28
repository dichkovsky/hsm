import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/features/cards/application/cards_service.dart';
import 'package:hsm/src/features/cards/presentation/cards_swiper/cards_swiper_screen_controller.dart';
import 'package:hsm/src/features/cards/presentation/widgets/card_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';
import 'package:loop_page_view/loop_page_view.dart';

class CardsSwiperScreen extends ConsumerWidget {
  const CardsSwiperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsListValue = ref.watch(cardsListFutureProvider);
    final swiperIndex = ref.watch(swiperIndexStateProvider);

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
    // * Otherwise, we use the current or previous value to show the products

    final pageController = LoopPageController(
      initialPage: swiperIndex,
      viewportFraction: 0.9,
      keepPage: true
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.cardsSwiper),
        centerTitle: true,
      ),
      body: LoopPageView.builder(
        itemCount: cards.length,
        controller: pageController,
        onPageChanged: (value) => ref.read(swiperIndexStateProvider.notifier).state = value,
        itemBuilder: (context, index) {
          final card =  cards[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: "card${card.id}",
                child: CardFace(
                  card: card,
                  onPressed: () => context.goNamed(
                    AppRoutes.cardsSwiperCardDetails.name,
                    pathParameters: {'id': card.id},
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
