import 'package:flutter/material.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/configs/constants.dart';
import 'package:japaneseflashcard_app/Japanese_Flashcard/enums/slide_direction.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({required this.child, required this.direction, this.animate = true,
    this.reset, this.animationCompleted,
    this.animationDelay = 0,
    this.animationDuration = 600, super.key});

  final Widget child;
  final SlideDirection direction; //hướng widget di chuyển
  final bool animate; //
  final bool? reset;
  final VoidCallback? animationCompleted;
  final int animationDuration;
  final int animationDelay;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;

  @override
  initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this)..addListener(() {
          if(_animationController.isCompleted){
            widget.animationCompleted?.call();
          }
        });
    // if(widget.animate){
    //   _animationController.forward();
    // }
    super.initState();
  }

  @override
  didUpdateWidget(covariant oldWidget){
    if(widget.reset == true){
      _animationController.reset();
    }
    if(widget.animate) {
      if(widget.animationDelay > 0){
        Future.delayed(Duration(milliseconds: widget.animationDelay),(){
          if(mounted){
            _animationController.forward();
          }
        });
      }else
        _animationController.forward();
      }
    super.didUpdateWidget(oldWidget);
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    late final Animation<Offset> animation;

    Tween<Offset> tween;

    switch(widget.direction){
      case SlideDirection.leftAway:
        tween = Tween<Offset>(begin: Offset(0,0), end: Offset(-1,0));
        break;
      case SlideDirection.rightAway:
        tween = Tween<Offset>(begin: Offset(0,0), end: Offset(1,0));
        break;
      case SlideDirection.leftIn:
        tween = Tween<Offset>(begin: Offset(-1,0), end: Offset(0,0));
        break;
      case SlideDirection.rightIn:
        tween = Tween<Offset>(begin: Offset(1,0), end: Offset(0,0));
        break;
      case SlideDirection.upIn:
        tween = Tween<Offset>(begin: Offset(0,1), end: Offset(0,0));
        break;
      case SlideDirection.none:
        tween = Tween<Offset>(begin: Offset(0,0), end: Offset(0,0));
        break;
    }

    animation = tween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    return SlideTransition(
        position: animation,
        child: widget.child,
    );
  }
}
