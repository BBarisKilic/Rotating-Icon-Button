// Copyright 2022 The RotatingIconButton Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

library rotating_button;

import 'dart:math';

import 'package:flutter/material.dart';

enum RotateType { quarter, semi, full }

enum ButtonShape { rectangle, circle }

class RotatingIconButton extends StatefulWidget {
  const RotatingIconButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.padding,
    this.rotateType = RotateType.quarter,
    this.clockwise = true,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.shape = ButtonShape.rectangle,
    this.background,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
  }) : super(key: key);

  final void Function() onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final RotateType rotateType;
  final bool clockwise;
  final Duration duration;
  final Curve curve;
  final ButtonShape shape;
  final Color? background;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;

  @override
  State<RotatingIconButton> createState() => _RotatingIconButtonState();
}

class _RotatingIconButtonState extends State<RotatingIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late double elevation;

  @override
  void initState() {
    super.initState();
    initController();
    addListener();
    initAnimation();
    setElevation();
  }

  void initController() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.duration,
    );
  }

  void addListener() => controller.addStatusListener(listener);

  void listener(AnimationStatus status) {
    if (!mounted) return;
    if (widget.rotateType == RotateType.full) return;

    if (status == AnimationStatus.completed) {
      controller.reverse();
    }
  }

  void initAnimation() {
    late final double angle;

    switch (widget.rotateType) {
      case RotateType.quarter:
        angle = 90 * pi / 180;
        break;
      case RotateType.semi:
        angle = 180 * pi / 180;
        break;
      case RotateType.full:
        angle = 360 * pi / 180;
        break;
    }

    animation = Tween<double>(begin: 0, end: widget.clockwise ? angle : -angle)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));
  }

  void setElevation() => elevation = widget.elevation ?? 0;

  @override
  void dispose() {
    controller
      ..removeStatusListener(listener)
      ..dispose();
    super.dispose();
  }

  void onTap() {
    if (!mounted) return;

    widget.onTap();
    controller.forward(from: 0.0);
  }

  void onTapDown(TapDownDetails tapDownDetails) {
    if (!mounted) return;
    if (widget.elevation == null) return;

    setState(() => elevation = 0);
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    if (!mounted) return;
    if (widget.elevation == null) return;

    setState(setElevation);
  }

  void onTapCancel() {
    if (!mounted) return;
    if (widget.elevation == null) return;

    setState(setElevation);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        onTapCancel: onTapCancel,
        child: Material(
          color: widget.background,
          shape: getShape(),
          elevation: elevation,
          shadowColor: widget.shadowColor,
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.all(8.0),
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) =>
                  Transform.rotate(angle: animation.value, child: widget.child),
            ),
          ),
        ),
      );

  ShapeBorder getShape() {
    switch (widget.shape) {
      case ButtonShape.rectangle:
        return RoundedRectangleBorder(
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : BorderRadius.zero,
        );
      case ButtonShape.circle:
        return const CircleBorder();
    }
  }
}
