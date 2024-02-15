import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/presentation/widgets/cards_ui_card.dart';
import 'package:flutter/material.dart';

class CardsHomeScreen extends StatelessWidget {
  const CardsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        padding: const EdgeInsets.all(Sizes.p8),
        children: const [
          CardsUICrad(CardsUICardType.cardOfTheDay),
          CardsUICrad(CardsUICardType.randomCard),
          CardsUICrad(CardsUICardType.swiper),
          CardsUICrad(CardsUICardType.gallery),
        ],
      ),
    );
  }
}
