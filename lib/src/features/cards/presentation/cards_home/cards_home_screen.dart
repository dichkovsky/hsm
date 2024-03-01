import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/presentation/widgets/cards_ui_card.dart';
import 'package:flutter/material.dart';

class CardsHomeScreen extends StatelessWidget {
  const CardsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const items = [
      CardsUICrad(CardsUICardType.cardOfTheDay),
      CardsUICrad(CardsUICardType.randomCard),
      CardsUICrad(CardsUICardType.swiper),
      CardsUICrad(CardsUICardType.gallery),
    ];

    return Container(
      alignment: Alignment.center,
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              padding: const EdgeInsets.all(Sizes.p8),
              children: items,
            );
          } else {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              children: items
            );
          }
        },
      ),
    );
  }
}
