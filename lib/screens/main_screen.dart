import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditations_player_app/models/item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // https://freesound.org/ - free music
  final audioPlayer = AudioPlayer();

  int? playingIndex;

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
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      items[index].imagePath,
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(items[index].name),
                  // Ternary operator
                  leading: IconButton(
                    icon: playingIndex == index
                        ? const FaIcon(FontAwesomeIcons.stop)
                        : const FaIcon(FontAwesomeIcons.play),
                    onPressed: () async {
                      if (playingIndex == index) {
                        setState(() {
                          playingIndex = null;
                        });

                        await audioPlayer.stop();
                      } else {
                        try {
                          await audioPlayer.play(AssetSource(items[index].audioPath));
                          setState(() {
                            playingIndex = index;
                          });
                        } catch (error) {
                          print(error);
                        }
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
