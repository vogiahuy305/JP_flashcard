import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({required this.child, super.key});

  final Widget child; //widget duoc tao hieu ung khi luot qua trai/phai

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation, _opacityAnimation;


  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this);
    super.initState();

    _scaleAnimation = Tween<double>(begin: 0.90, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOutSine));

    _opacityAnimation = Tween<double>(begin: 0.50, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOutSine));

    _animationController.forward();
  }

  @override
  dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Opacity(
          opacity: _opacityAnimation.value,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(_scaleAnimation.value),
            child: widget.child,
          ),
        ));
  }
}

