import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final int? delay;
  final Widget? child;

  const FadeAnimation({super.key, this.delay, this.child});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  AnimationController? animation;
  Animation<double>? _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.delay!),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation!);

    animation!.forward();
  }

  @override
  void dispose() {
    animation!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInFadeOut!,
      child: widget.child,
    );
  }
}
