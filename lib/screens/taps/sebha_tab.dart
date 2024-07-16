import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset("assets/images/head.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 79.0),
              child: Transform.rotate(
                  angle: angel,
                  child: GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Image.asset("assets/images/body.png"))),
            )
          ],
        ),
        SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          "عدد التسبيحات",
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            wordSpacing: 4,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              height: 81,
              width: 69,
              decoration: BoxDecoration(
                  color: Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Text(
                "$countter",
                style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  wordSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
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
                  color: Color(0xFFB7935F),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                azkar[index],
                style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  wordSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
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
