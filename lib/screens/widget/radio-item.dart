import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:islami_app/models/RadioModel.dart';

class RadioItem extends StatelessWidget {
  final Radios radio;
  final AudioPlayer player;

  RadioItem({required this.player, required this.radio, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          radio.name ?? "Unknown Station",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 57),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                if (radio.url != null) {
                  try {
                    await player.play(UrlSource(radio.url!));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error playing radio: $e')));
                  }
                }
              },
              icon: Icon(Icons.play_arrow, size: 70),
            ),
            SizedBox(width: 40),
            IconButton(
              onPressed: () async {
                try {
                  await player.pause();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error stopping radio: $e')));
                }
              },
              icon: Icon(Icons.stop, size: 70),
            ),
          ],
        )
      ],
    );
  }
}
