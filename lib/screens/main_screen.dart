import 'package:flutter/material.dart';
import 'package:meditations_player_app/models/item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // Forest, ocean, wind, night, waterfall
  List<Item> items = [
    Item(
      name: "Forest sounds",
      // audioplayers package assumes assets are in 'assets' folder
      audioPath: "meditation_audios/forest.mp3",
      imagePath: "assets/meditation_images/forest.jpeg",
    ),
    Item(
      name: "Ocean breeze",
      audioPath: "meditation_audios/ocean.mp3",
      imagePath: "assets/meditation_images/ocean.jpeg",
    ),
    Item(
      name: "Windy night",
      audioPath: "meditation_audios/wind.mp3",
      imagePath: "assets/meditation_images/wind.jpeg",
    ),
    Item(
      name: "Night sounds",
      audioPath: "meditation_audios/night.mp3",
      imagePath: "assets/meditation_images/night.jpeg",
    ),
    Item(
      name: "Waterfall",
      audioPath: 'meditation_audios/waterfall.mp3',
      imagePath: 'assets/meditation_images/waterfall.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
