import 'dart:math';

import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';
import 'package:provider/provider.dart';

import '../../animations/half_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../enums/slide_direction.dart';
import '../../notifiers/flashcard_notifier.dart';
import 'card_display.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardNotifier>(
      builder: (_,notifier,__) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if(details.primaryVelocity! > 100){
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord(context: context);
          }
          if(details.primaryVelocity! < -100){
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.resetCard2();
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord(context: context);
          }
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: () {
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipedDirection,
            child: Center(
              child: Container(
                height: size.height * 0.7,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCircularBorderRadius),
                    border: Border.all(
                      color: Colors.black,
                      width: kCardBorderWidth
                    ),
                    color: Theme.of(context).primaryColor
                ),
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: CardDisplay(isCard1: false)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}