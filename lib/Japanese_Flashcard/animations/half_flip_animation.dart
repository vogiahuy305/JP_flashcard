import 'dart:math';
import 'package:flutter/material.dart';

class HalfFlipAnimation extends StatefulWidget {
  const HalfFlipAnimation({required this.child, required this.animate, required this.reset,
  required this.flipFromHalfWay, required this.animationCompleted, super.key});

  final Widget child; // widget con ap dung flip
  final bool animate; // xac dinh flip duoc kich hoat hay k
  final bool reset; //xac dinh flip duoc reset ve ban dau k
  final bool flipFromHalfWay; //xac dinh flip b=co bat dau tu trang thai da flip mot nua hay k
  final VoidCallback animationCompleted; //ham callback dc goi khi flip hoan thanh

  @override
  State<HalfFlipAnimation> createState() => _HalfFlipAnimationState();
}

class _HalfFlipAnimationState extends State<HalfFlipAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 200),
        vsync: this)..addListener(() {
          if(_animationController.isCompleted)
            {
              widget.animationCompleted.call();
            }
        });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(covariant oldWidget) {
    if(widget.reset){
    _animationController.reset();
    }
    if(widget.animate){
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double rotationAdjustment = 0;
    if(widget.flipFromHalfWay){
      rotationAdjustment =  pi / 2;
    }
    return AnimatedBuilder(
      animation: _animationController,
      builder:(context, child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY((_animationController.value * pi) / 2 )
            ..rotateY(rotationAdjustment),
        child: widget.child,
      ),
    ) ;
  }
}
