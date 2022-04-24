// Copyright 2022 The RotatingButton Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

library rotating_button;

import 'dart:math';

import 'package:flutter/material.dart';

class RotatingButton extends StatefulWidget {
  const RotatingButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.degrees = 90.0,
    this.clockwise = true,
  }) : super(key: key);

  final void Function() onTap;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final double degrees;
  final bool clockwise;

  @override
  State<RotatingButton> createState() => _RotatingButtonState();
}

class _RotatingButtonState extends State<RotatingButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initController();
    _addListener();
    _initAnimation(
      degrees: widget.degrees,
      clockwise: widget.clockwise,
    );
  }

  @override
  void dispose() {
    _controller.removeStatusListener(
      (status) {
        if (mounted) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          }
        }
      },
    );
    _controller.dispose();
    super.dispose();
  }

  void _initController() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.duration,
    );
  }

  void _addListener() {
    _controller.addStatusListener(
      (status) {
        if (mounted) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          }
        }
      },
    );
  }

  void _initAnimation({required double degrees, required bool clockwise}) {
    final double angle = degrees * pi / 180;

    _animation =
        Tween<double>(begin: 0, end: clockwise ? angle : -angle).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
  }

  void _onTap() {
    if (mounted) {
      widget.onTap();
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _animation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
