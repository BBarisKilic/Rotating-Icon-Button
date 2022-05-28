// Copyright 2022 The RotatingIconButton Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rotating_icon_button/rotating_icon_button.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Media Player',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MediaPlayer(),
      );
}

class MediaPlayer extends StatefulWidget {
  const MediaPlayer({Key? key}) : super(key: key);

  @override
  State<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Media Player'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/music.svg',
              height: 240,
              width: 240,
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 10,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white54,
                      ),
                    ),
                    Container(
                      height: 10,
                      margin: const EdgeInsets.only(left: 40, right: 160),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '02:37',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '03:46',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Call the RotatingButton widget anywhere in your widget tree.
                RotatingIconButton(
                  onTap: () {},
                  duration: const Duration(milliseconds: 200),
                  clockwise: false,
                  background: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  child: SvgPicture.asset(
                    'assets/backward_5.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SvgPicture.asset(
                  'assets/pause.svg',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  width: 20,
                ),
                RotatingIconButton(
                  onTap: () {},
                  duration: const Duration(milliseconds: 200),
                  clockwise: true,
                  background: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  child: SvgPicture.asset(
                    'assets/forward_5.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
