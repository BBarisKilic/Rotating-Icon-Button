// Copyright 2022 The RotatingIconButton Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

library rotating_button;

import 'dart:math';

import 'package:flutter/material.dart';

/// An enum to make it easier to set the rotation type of the child widget.
///
/// There are three different rotation types:
///
/// 1- [RotateType.full]
///
/// 2- [RotateType.semi]
///
/// 3- [RotateType.quarter]
enum RotateType {
  /// [RotateType.quarter] => To rotate the child widget 90 degrees
  quarter,

  /// [RotateType.semi] => To rotate the child widget 180 degrees
  semi,

  /// [RotateType.full] => To rotate the child widget completely.
  full,
}

/// An enum to make it easier to set the shape of the button.
///
/// There are two different shapes:
///
/// 1- [ButtonShape.rectangle]
///
/// 2- [ButtonShape.circle]
enum ButtonShape {
  /// [ButtonShape.rectangle] => To give this button a rectangle or
  /// square shape.
  rectangle,

  /// [ButtonShape.circle] => To give this button a circle shape.
  circle,
}

/// [RotatingIconButton] Widget
///
/// Flutter package for rotating and smoothly animating any child
/// widget of its own when tapped.
///
/// The package has been written solely in Dart language.
class RotatingIconButton extends StatefulWidget {
  /// Create [RotatingIconButton] widget.
  ///
  /// A widget for rotating and smoothly animating any child widget
  /// of its own when tapped.
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
    this.elevation = 0.0,
    this.shadowColor,
    this.background,
    this.borderRadius,
  }) : super(key: key);

  /// [onTap] Function that provides you the ability to control tap action.
  ///
  /// With this function, you can easily assign tasks to the widget.
  final void Function() onTap;

  /// This widget will be displayed inside the button.
  ///
  /// It is required to provide a widget to show it as part of the button.
  /// Normally Icon widget is expected as a [child] widget but it is not
  /// limited only to it.
  final Widget child;

  /// Add [padding] to the [child] widget to customize the button.
  ///
  /// The default value is "const EdgeInsets.all(8.0)".
  final EdgeInsetsGeometry? padding;

  /// Assign a [rotateType] to set the rotation type of the [child] widget.
  ///
  /// Possible rotation types are:
  ///
  /// [RotateType.full] => To rotate the [child] widget completely.
  ///
  /// [RotateType.semi] => To rotate the [child] widget 180 degrees
  /// and rotate back.
  ///
  /// [RotateType.quarter] => To rotate the [child] widget 90 degrees
  /// and rotate back.
  final RotateType rotateType;

  /// A variable to determine the direction of the animation.
  ///
  /// The default value is "true".
  final bool clockwise;

  /// A variable to determine the [duration] of the animation.
  ///
  /// The default value is "const Duration(milliseconds: 300)".
  final Duration duration;

  /// A variable to set the [curve] of the animation.
  ///
  /// The default value is "Curves.easeInOut".
  ///
  /// For more info please check the official documentation related
  /// to this topic:
  ///
  /// https://api.flutter.dev/flutter/animation/Curves-class.html
  final Curve curve;

  /// Assign a [shape] to set the shape of the button.
  ///
  /// The default value is "ButtonShape.rectangle".
  ///
  /// Possible shapes are:
  ///
  /// [ButtonShape.rectangle] => To give this button a rectangle or
  /// square shape.
  ///
  /// [ButtonShape.circle] => To give this button a circle shape.
  final ButtonShape shape;

  /// A variable to set the [elevation] of the button.
  ///
  /// The default value is "0.0".
  final double elevation;

  /// A variable to set the [shadowColor] of the button.
  ///
  /// Please note that this color will be visible only if the
  /// [elevation]'s value greater than 0.
  final Color? shadowColor;

  /// A variable to set the [background] color of the button.
  ///
  /// If you want to show only the child widget that you provide, you
  /// should set this [background] color to "Colors.transparent".
  final Color? background;

  /// A variable to set the [borderRadius] of the button.
  ///
  /// The default value is "0".
  ///
  /// Please note that this [borderRadius] will be applied to the button
  /// only if its shape is "ButtonShape.rectangle".
  final double? borderRadius;

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
    if (status != AnimationStatus.completed) return;

    controller.reverse();
  }

  void initAnimation() {
    late final double angle;

    switch (widget.rotateType) {
      case RotateType.quarter:
        angle = pi / 2;
        break;
      case RotateType.semi:
        angle = pi;
        break;
      case RotateType.full:
        angle = 2 * pi;
        break;
    }

    animation = Tween<double>(begin: 0, end: widget.clockwise ? angle : -angle)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));
  }

  void setElevation() => elevation = widget.elevation;

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
    if (widget.elevation == 0) return;

    setState(() => elevation = 0);
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    if (!mounted) return;
    if (widget.elevation == 0) return;

    setState(setElevation);
  }

  void onTapCancel() {
    if (!mounted) return;
    if (widget.elevation == 0) return;

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
