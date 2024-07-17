import 'package:flutter/material.dart';
import 'package:islami_app/theme/app-colors.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebahpage';
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int countter = 0;

  int index = 0;
  Color? countcolor;
  Color? textBodyColor;
  double angel = 0;
  String? head;
  String? body;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];

  @override
  Widget build(BuildContext context) {
    ThemeMode currentThemeMode =
        Theme.of(context).brightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;
    selectedImage(currentThemeMode);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(head!),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 79.0),
              child: Transform.rotate(
                  angle: angel,
                  child: GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Image.asset(body!))),
            )
          ],
        ),
        SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          "عدد التسبيحات",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              height: 81,
              width: 69,
              decoration: BoxDecoration(
                  color: countcolor, borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Text(
                "$countter",
                style: Theme.of(context).textTheme.labelMedium,
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: textBodyColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                azkar[index],
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        )
      ],
    );
  }

  onTap() {
    countter++;
    if (countter % 33 == 0) {
      index++;
      countter++;
      countter = 0;
    }
    if (index == azkar.length) {
      index = 0;
    }
    angel += 360 / 4;
    setState(() {});
  }

  selectedImage(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      head = "assets/images/head.png";
      body = "assets/images/body.png";
      countcolor = AppColor.PraimaryColor;
      textBodyColor = AppColor.PraimaryColor;
    } else {
      body = "assets/images/body-dark.png";
      head = "assets/images/head-darck.png";
      countcolor = AppColor.DarchPraimaryColor;
      textBodyColor = AppColor.YalowwColor;
    }
  }
}
