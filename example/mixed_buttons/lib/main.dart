// Copyright 2022 The RotatingIconButton Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:rotating_icon_button/rotating_icon_button.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Mixed Buttons',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MixedButtons(),
      );
}

class MixedButtons extends StatefulWidget {
  const MixedButtons({Key? key}) : super(key: key);

  @override
  State<MixedButtons> createState() => _MixedButtonsState();
}

class _MixedButtonsState extends State<MixedButtons> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: const Text(
            'Mixed Buttons',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.cyanAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildFirstRow(),
              buildSecondRow(),
              buildThirdRow(),
              buildFourthRow(),
              buildFifthdRow(),
              buildSixthRow(),
            ],
          ),
        ),
      );

  Widget buildFirstRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatingIconButton(
            onTap: () {},
            background: Colors.transparent,
            clockwise: false,
            child: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
          ),
          RotatingIconButton(
            onTap: () {},
            background: Colors.transparent,
            padding: const EdgeInsets.all(2.0),
            shape: ButtonShape.circle,
            child: const Icon(
              Icons.settings_outlined,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      );

  Row buildSecondRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatingIconButton(
            onTap: () {},
            elevation: 10.0,
            background: Colors.amber,
            clockwise: false,
            child: const Icon(
              Icons.search,
              color: Colors.indigo,
            ),
          ),
          RotatingIconButton(
            onTap: () {},
            elevation: 10.0,
            background: Colors.indigo,
            shape: ButtonShape.circle,
            child: const Icon(
              Icons.search,
              color: Colors.amber,
            ),
          ),
        ],
      );

  Row buildThirdRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatingIconButton(
            onTap: () {},
            elevation: 20.0,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            rotateType: RotateType.semi,
            background: Colors.deepPurple,
            clockwise: false,
            child: const Icon(
              Icons.attach_file,
              color: Colors.amberAccent,
            ),
          ),
          RotatingIconButton(
            onTap: () {},
            elevation: 20.0,
            background: Colors.amberAccent,
            shape: ButtonShape.circle,
            rotateType: RotateType.semi,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: const Icon(
              Icons.attach_file,
              color: Colors.deepPurple,
            ),
          ),
        ],
      );

  Row buildFourthRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatingIconButton(
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
          ),
          RotatingIconButton(
            onTap: () {},
            elevation: 10.0,
            shadowColor: Colors.pink,
            background: Colors.pink,
            rotateType: RotateType.semi,
            shape: ButtonShape.circle,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: const Icon(
              Icons.navigation,
              color: Colors.grey,
            ),
          ),
        ],
      );

  Row buildFifthdRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatingIconButton(
            onTap: () {},
            elevation: 10.0,
            borderRadius: 10.0,
            rotateType: RotateType.full,
            duration: const Duration(milliseconds: 600),
            background: Colors.amber,
            clockwise: false,
            child: const Icon(
              Icons.rotate_left,
              color: Colors.indigo,
            ),
          ),
          RotatingIconButton(
            onTap: () {},
            elevation: 10.0,
            rotateType: RotateType.full,
            duration: const Duration(milliseconds: 600),
            background: Colors.indigo,
            shape: ButtonShape.circle,
            child: const Icon(
              Icons.rotate_right,
              color: Colors.amber,
            ),
          ),
        ],
      );

  Widget buildSixthRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.brown,
            padding: const EdgeInsets.all(2.0),
            child: RotatingIconButton(
              onTap: () {},
              background: Colors.cyanAccent,
              padding: EdgeInsets.zero,
              clockwise: false,
              child: const Icon(
                Icons.add,
                color: Colors.brown,
              ),
            ),
          ),
          RotatingIconButton(
            onTap: () {},
            background: Colors.deepOrange,
            padding: const EdgeInsets.all(2.0),
            shape: ButtonShape.circle,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyanAccent,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.deepOrange,
              ),
            ),
          ),
        ],
      );
}
