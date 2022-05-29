# Rotating Icon Button | Flutter Package

[Flutter](https://flutter.dev/) package for rotating and smoothly animating any child widget of its own when tap. The package has been written solely in [Dart Language](https://dart.dev/).

&nbsp;

| ![rotating_icon_button_gif_1](https://github.com/BBarisKilic/Rotating-Icon-Button/blob/master/screenshot/rotating_icon_button_gif_1.gif?raw=true) | ![rotating_icon_button_gif_4](https://github.com/BBarisKilic/Rotating-Icon-Button/blob/master/screenshot/rotating_icon_button_gif_4.gif?raw=true) |  ![rotating_icon_button_gif_3](https://github.com/BBarisKilic/Rotating-Icon-Button/blob/master/screenshot/rotating_icon_button_gif_3.gif?raw=true)
| :-: | :-: | :-: |

&nbsp;

## Features

A powerful and fully customizable widget. With this package, you can easily create live buttons that rotate in a direction you want, in a duration you assign, etc.

`RotatingIconButton` widget allows you to create living buttons to make your UI look lovely.

&nbsp;

<p align="center"><img src="https://github.com/BBarisKilic/Rotating-Icon-Button/blob/master/screenshot/rotating_icon_button_gif_2.gif?raw=true" width="300"></p>

&nbsp;

## Getting started

Let's take a look at how to implement `RotatingIconButton` to create lovely animating buttons.

First, add the following line to `pubspec.yaml`:
```yaml
rotating_icon_button: ^1.0.0
```

Second, import `RotatingIconButton`:
```dart
import 'package:rotating_icon_button/rotating_icon_button.dart';
```

## Usage

Basic usage example: 

`main.dart`
```dart
// Import RotatingIconButton
import 'package:rotating_icon_button/rotating_icon_button.dart';

@override
Widget build(BuildContext context) {
    // Call the RotatingIconButton widget anywhere in your widget tree.
    return RotatingIconButton(
      onTap: () {},
      elevation: 10.0,
      shadowColor: Colors.pink,
      borderRadius: 20.0,
      rotateType: RotateType.semi,
      clockwise: false,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      background: Colors.grey,
      child: const Icon(
        Icons.navigation,
        color: Colors.pink,
      ),
    );
}
```

&nbsp;

## Example

More examples can be found in `/example` folder on [GitHub](https://github.com/BBarisKilic/Rotating-Icon-Button). 

[Media Player](https://github.com/BBarisKilic/Rotating-Icon-Button/tree/master/example/media_player) - an example of basic implementation of `RotatingIconButton`. Simple project that simulates a media player. As usual, the player needs backward and forward buttons. Thanks to the `RotatingIconButton` package, it is so easy to create buttons with rotating animations that perfectly fit the situation.

[Mixed Buttons](https://github.com/BBarisKilic/Rotating-Icon-Button/tree/master/example/mixed_buttons) - an example of basic implementation of `RotatingIconButton`. Simple project that shows many `RotatingIconButton` in different types and shapes. It is mainly created to show you the power of this widget and help you to understand how to customize your buttons through using this widget.

&nbsp;

## Additional information

This package has been written solely in Dart language, and it is not using any third-party package as a dependency.

For more information please visit [GitHub](https://github.com/BBarisKilic/Rotating-Icon-Button).

&nbsp;

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/BBarisKilic/Rotating-Icon-Button/issues).

&nbsp;

## Maintainers

- [Bulent Baris Kilic](https://github.com/BBarisKilic)