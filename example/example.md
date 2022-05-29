# Example
 
[Media Player](https://github.com/BBarisKilic/Rotating-Icon-Button/tree/master/example/media_player) - an example of basic implementation of `RotatingIconButton`. Simple project that simulates a media player. As usual, the player needs backward and forward buttons. Thanks to the `RotatingIconButton` package, it is so easy to create buttons with rotating animations that perfectly fit the situation.

[Mixed Buttons](https://github.com/BBarisKilic/Rotating-Icon-Button/tree/master/example/mixed_buttons) - an example of basic implementation of `RotatingIconButton`. Simple project that shows many `RotatingIconButton` in different types and shapes. It is mainly created to show you the power of this widget and help you to understand how to customize your buttons through using this widget.

---

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

---