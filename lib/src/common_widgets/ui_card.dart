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
      this.titleColor,
      this.subTitle,
      this.subTitleColor, 
      this.onTap});

  final double height;
  final String title;
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
        clipBehavior: Clip.antiAlias,
        color: bgColor,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              if (bgImage != null)
                Positioned(
                  right: Sizes.p8,
                  top: 0,
                  bottom: 0,
                  child:CustomImage(imageUrl: bgImage)
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
