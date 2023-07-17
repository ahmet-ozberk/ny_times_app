import 'package:flutter/material.dart';

class AppSlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration opacityDuration;
  final AppSlidePosition position;
  final Alignment alignment;
  final Curve curve;
  final double value;
  final bool isOpacityAnimation;
  final Duration delay;
  final Function(AnimationController controller)? addListener;

  const AppSlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.opacityDuration = const Duration(milliseconds: 400),
    @Deprecated('Use "alignment" instead') this.position = AppSlidePosition.top,
    this.alignment = Alignment.topCenter,
    this.curve = Curves.easeInOut,
    this.value = 100,
    this.addListener,
    this.isOpacityAnimation = true,
    this.delay = Duration.zero,
  });

  @override
  State<AppSlideAnimation> createState() => _AppSlideAnimationState();
}

class _AppSlideAnimationState extends State<AppSlideAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  bool _isOpacity = false;

  AlignmentTween _tween() =>
      AlignmentTween(begin: widget.alignment, end: Alignment.center);

  Offset _offset() {
    if (widget.alignment == Alignment.topCenter) {
      return Offset(0.0, _animation.value.y);
    }
    if (widget.alignment == Alignment.centerLeft) {
      return Offset(_animation.value.x, 0.0);
    }
    if (widget.alignment == Alignment.centerRight) {
      return Offset(_animation.value.x, 0.0);
    }
    if (widget.alignment == Alignment.bottomCenter) {
      return Offset(0.0, _animation.value.y);
    }
    if (widget.alignment == Alignment.center) {
      return Offset(0.0, -_animation.value.y);
    }
    if (widget.alignment == Alignment.topLeft) {
      return Offset(_animation.value.x, _animation.value.y);
    }
    if (widget.alignment == Alignment.topRight) {
      return Offset(_animation.value.x, _animation.value.y);
    }
    if (widget.alignment == Alignment.bottomLeft) {
      return Offset(_animation.value.x, _animation.value.y);
    }
    if (widget.alignment == Alignment.bottomRight) {
      return Offset(_animation.value.x, _animation.value.y);
    }
    return Offset(0.0, _animation.value.y);
  }

  void init() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = _tween().animate(CurvedAnimation(
        parent: _controller, curve: Interval(0, 1, curve: widget.curve)))
      ..addListener(() {
        if (widget.isOpacityAnimation) {
          if (_controller.status == AnimationStatus.completed ||
              _controller.status == AnimationStatus.forward) {
            _isOpacity = true;
          } else if (_controller.status == AnimationStatus.dismissed ||
              _controller.status == AnimationStatus.reverse) {
            _isOpacity = false;
          }
        }
        if (widget.addListener != null) {
          widget.addListener!(_controller);
        }
        setState(() {});
      });
    Future.delayed(widget.delay, () {
      _controller.forward();
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      key: widget.key,
      offset: Offset(_offset().dx * widget.value, _offset().dy * widget.value),
      child: AnimatedOpacity(
        opacity: _isOpacity ? 1 : 0,
        duration: widget.opacityDuration,
        child: widget.child,
      ),
    );
  }
}

enum AppSlidePosition {
  top,
  left,
  right,
  bottom,
  center,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}