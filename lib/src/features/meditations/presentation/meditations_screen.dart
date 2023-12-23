import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/common_widgets/ui_card.dart';
import 'package:flutter/material.dart';

class MeditationsScreen extends StatelessWidget {
  const MeditationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        children: const [
          UICard(
            height: Sizes.p104, 
            title: "Meditation 1",
            subTitle: "Example meditation card",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 2",
            subTitle: "One more example meditation card",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 3",
            subTitle: "I'm pretty sure this data is just randomly generated.",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 4",
            subTitle: "Ow shit, how meny meditations are there?",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 5",
            subTitle: "Holly mother of god! One more? Are you kidding me?",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 6",
            subTitle: "I'm seriously starting to doubt it is going to end well",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 7",
            subTitle: "I'm so excited to scroll through this endless list of nothing.",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 8",
            subTitle: "I've been scrolling through this list for so long, I think I've entered a new dimension.",
          ),
          UICard(
            height: Sizes.p104, 
            title: "Meditation 9",
            subTitle: "This is the last one, I promise",
          ),
        ]
      ),
    );
  }
}