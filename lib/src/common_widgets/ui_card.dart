import 'dart:math';

import 'package:hsm/src/common_widgets/custom_image.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class UICard extends StatelessWidget {
  const UICard(
      {super.key,
      required this.height,
      required this.title,
      this.bgColor,
      this.bgImage,
      this.needsDecor = false,
      this.titleColor,
      this.subTitle,
      this.subTitleColor, 
      this.onTap});

  final double height;
  final String title;
  final bool needsDecor;
  final Color? titleColor;
  final String? subTitle;
  final Color? subTitleColor;
  final Color? bgColor;
  final String? bgImage;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        clipBehavior: Clip.none,
        color: bgColor,
        elevation: needsDecor ? 2 : 1,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              if (bgImage != null)
                Positioned(
                  right: Sizes.p8,
                  top: 0,
                  bottom: 0,
                  child: needsDecor ? 
                    Transform.rotate(
                      angle: 1.5*(pi / 20), 
                      child: Container(
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)), boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black12)]),
                        clipBehavior: Clip.antiAlias,
                        child: CustomImage(
                          imageUrl: bgImage,
                        ),
                      )
                    ) 
                    : 
                    CustomImage(
                      imageUrl: bgImage,
                    )
                ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(Sizes.p8, Sizes.p8, Sizes.p88, Sizes.p8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                                color: titleColor,
                              )),
                      if (subTitle != null)
                        Text(subTitle!,
                            style: DefaultTextStyle.of(context).style.apply(
                                  color: subTitleColor,
                                ),
                        ),
                    ],
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
