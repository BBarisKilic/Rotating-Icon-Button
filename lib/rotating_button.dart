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
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    initController();
    addListener();
    initAnimation(degrees: widget.degrees, clockwise: widget.clockwise);
  }

  void initController() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.duration,
    );
  }

  void addListener() {
    controller.addStatusListener(listener);
  }

  void listener(AnimationStatus status) {
    if (mounted) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    controller
      ..removeStatusListener(listener)
      ..dispose();
    super.dispose();
  }

  void initAnimation({required double degrees, required bool clockwise}) {
    final double angle = degrees * pi / 180;

    animation =
        Tween<double>(begin: 0, end: clockwise ? angle : -angle).animate(
      CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    );
  }

  void onTap() {
    if (mounted) {
      widget.onTap();
      controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) =>
              Transform.rotate(angle: animation.value, child: widget.child),
        ),
      );
}
