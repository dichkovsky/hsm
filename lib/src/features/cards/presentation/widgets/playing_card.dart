import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hsm/src/common_widgets/custom_image.dart';

class PlayingCard extends StatefulWidget {

  const PlayingCard(
      {super.key,
      this.faceUrl = '',
      this.backUrl = '',
      this.faceUp = false,
      this.width = 200,
      this.height = 300,
      this.cornerRadius = 10,
      this.flipSpeed = 500, 
      this.onCardTap});

  final String faceUrl;
  final String backUrl;
  final double width;
  final double height;
  final bool faceUp;
  final double cornerRadius;
  final int flipSpeed;
  final GestureTapCallback? onCardTap;

  void switchSide() {
    
  }

  @override
  State<PlayingCard> createState() => _PlayingCardState();
}

class _PlayingCardState extends State<PlayingCard> {
  bool _showBack = true;
  bool _flipXAxis = true;

  @override
  void initState() {
    super.initState();
    _showBack = !widget.faceUp;
    _flipXAxis = true;
  }

  void switchSide() {
    setState(() {
      _showBack = !_showBack;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size(widget.width, widget.height)),
      child: GestureDetector(
        onTap: widget.onCardTap,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: widget.flipSpeed),
          transitionBuilder: __transitionBuilder,
          layoutBuilder: (widget, list) =>
              Stack(children: [widget ?? const Text("Error"), ...list]),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInBack.flipped,
          child: _showBack ? _buildBack() : _buildFace(),
        ),
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showBack) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  Widget _buildBack() {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: Colors.white,
      faceName: "Suit",
      child: CustomImage(imageUrl: widget.backUrl),
      //child: CachedNetworkImage(imageUrl: widget.backUrl),
    );
  }

  Widget _buildFace() {
    return __buildLayout(
      key: const ValueKey(false),
      backgroundColor: Colors.white,
      faceName: "Face",
      child: CustomImage(imageUrl: widget.faceUrl),
      //child: CachedNetworkImage(imageUrl: widget.faceUrl),
    );
  }

  Widget __buildLayout(
      {required Key key,
      required Widget child,
      required String faceName,
      required Color backgroundColor}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(widget.cornerRadius),
          color: backgroundColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: .5,
                offset: Offset(1, 1))
          ]),
      child: Center(
        child: child,
      ),
    );
  }
}
