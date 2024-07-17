
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pleng/group/current_play/current_play.dart';


class CurrentPlayData extends StatelessWidget {
  const CurrentPlayData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CurrentPlay(
          musicList: [
            {
              'backgroundImageUrl': 'https://i.pinimg.com/474x/16/af/85/16af85f2e9b2998dc0303988c69cdb08.jpg',
              'musicTitle': 'LUNCH',
              'artist': 'Billie Eilish, FINNEAS',
            },
            {
              'backgroundImageUrl': 'https://i.pinimg.com/564x/a6/d6/5f/a6d65fe7979776f84f9408791342135c.jpg',
              'musicTitle': 'WELCOME TO NEW YORK',
              'artist': 'Taylor Swift',
            },
            {
              'backgroundImageUrl': 'https://i.pinimg.com/736x/ac/cc/72/accc72eef5a6087e22cacf25bec852a1.jpg',
              'musicTitle': 'INTRO(END OF THE WORLD)',
              'artist': 'Ariana Grande',
            },
            {
              'backgroundImageUrl': 'https://i.pinimg.com/564x/eb/6c/00/eb6c002774c6dbc232b7b28ce85703d1.jpg',
              'musicTitle': 'CRUEL SUMMER',
              'artist': 'Taylor Swift',
            },
            
            
            {
              'backgroundImageUrl': 'https://i.pinimg.com/564x/62/bb/58/62bb58dfc64763cdc152169de67c3f7e.jpg',
              'musicTitle': 'STARBOY',
              'artist': 'The Weeknd',
            },
            {
              'backgroundImageUrl': 'https://i.pinimg.com/564x/7f/19/56/7f1956d25bba4edda5cf9a74f66bbd1c.jpg',
              'musicTitle': 'HAPPY THAT EVER',
              'artist': 'Billie Eilish',
            },
            {
              'backgroundImageUrl': 'https://i.pinimg.com/564x/40/cb/45/40cb4561f5cde1050400a468db763bc6.jpg',
              'musicTitle': 'LOVER',
              'artist': 'Taylor Swift',
            },
            {
              'backgroundImageUrl': 'https://i.pinimg.com/564x/e6/4c/00/e64c00eb7808981c7f0ed5eb22ab6602.jpg',
              'musicTitle': 'BORED',
              'artist': 'Billie Eilish',
            },
          ],
        ),
      ),
    );
  }
}