import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Image.asset(
            "assets/images/radio-bg.png",
            height: 222,
          ),
        ),
        SizedBox(
          height: 57,
        ),
        Text(
          textAlign: TextAlign.center,
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          height: 57,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("assets/images/Iconback.png"),
                )),
            SizedBox(
              width: 40,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 70,
                  Icons.play_arrow,
                )),
            SizedBox(
              width: 40,
            ),
            IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("assets/images/Iconnext.png"),
                ))
          ],
        )
      ],
    );
  }
}
