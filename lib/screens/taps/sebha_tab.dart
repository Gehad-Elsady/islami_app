import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/theme/app-colors.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebahpage';
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int countter = 0;
  int index = 0;
  double angel = 0;
  List<String> azkar = [
    "azkar-f".tr(),
    "azkar-ff".tr(),
    "azkar-fff".tr(),
    "azkar-ffff".tr(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(provider.appTheme == ThemeMode.dark
                  ? "assets/images/head-darck.png"
                  : "assets/images/head.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 79.0),
              child: Transform.rotate(
                  angle: angel,
                  child: GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Image.asset(provider.appTheme == ThemeMode.dark
                          ? "assets/images/body-dark.png"
                          : "assets/images/body.png"))),
            )
          ],
        ),
        SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          "number-of-tasbihs".tr(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              height: 81,
              width: 69,
              decoration: BoxDecoration(
                  color: provider.appTheme == ThemeMode.dark
                      ? AppColor.DarchPraimaryColor
                      : AppColor.PraimaryColor,
                  borderRadius: BorderRadius.circular(25)),
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
                  color: provider.appTheme == ThemeMode.dark
                      ? AppColor.YalowwColor
                      : AppColor.PraimaryColor,
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
}
