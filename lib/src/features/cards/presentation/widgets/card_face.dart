import 'package:google_fonts/google_fonts.dart';
import 'package:hsm/src/common_widgets/custom_image.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/cards/domain/hsm_card.dart';
import 'package:flutter/material.dart';

class CardFace extends StatelessWidget {
  static const cardAspect = 0.679;

  const CardFace({super.key, required this.card, this.onPressed});
  final HSMCard card;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const cardFaceKey = Key('card-face');
  static var cardTextStyle = GoogleFonts.poiretOne(
    color: const Color.fromARGB(255, 34, 6, 6),
    fontWeight: FontWeight.w600
  );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: cardAspect,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(Sizes.p12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          key: cardFaceKey,
          onTap: onPressed,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: CustomImage(imageUrl: card.faceURL)
              ),
              CardOverlay(card: card),
            ],
          ),
        ),
      ),
    );
  }
}

class CardOverlay extends StatelessWidget {
  const CardOverlay({
    super.key,
    required this.card,
  });

  final HSMCard card;

  static const titleBg = 'assets/elements/plashka.png';
  static const titleBgAlign = Alignment(0, .8);
  static const titleBgWidthFactor = .8;

  static const titleAlign = Alignment(0, .77);
  static const titleHeightFactor = .07;

  static const numberBg = 'assets/elements/c1.png';
  static const numberBgWidthFactor = .2;
  
  static const numberAlign = Alignment(.01, .90);
  static const numberHeightFactor = .05;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: titleBgAlign,
          child: FractionallySizedBox(
              widthFactor: titleBgWidthFactor,
              child: Image.asset(
                titleBg,
                fit: BoxFit.contain,
              )),
        ),
        FractionallySizedBox(
          widthFactor: numberBgWidthFactor,
          child: Image.asset(
            numberBg,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: titleAlign,
          child: FractionallySizedBox(
            heightFactor: titleHeightFactor,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                card.title, 
                style: CardFace.cardTextStyle
              ),
            ),
          ),
        ),
        Align(
          alignment: numberAlign,
          child: FractionallySizedBox(
            heightFactor: numberHeightFactor,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                card.cardNo.toString(), style: CardFace.cardTextStyle
              )
            ),
          ),
        ),
      ],
    );
  }
}
