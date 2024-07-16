import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Them",
            style: GoogleFonts.elMessiri(
              fontSize: 25,
              wordSpacing: 4,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xffB7935F))),
              child: Text(
                "Light",
                style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  wordSpacing: 4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "language",
            style: GoogleFonts.elMessiri(
              fontSize: 25,
              wordSpacing: 4,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Text("Language",
                          style: GoogleFonts.elMessiri(
                            fontSize: 25,
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text("Arabic",
                              style: GoogleFonts.elMessiri(
                                fontSize: 30,
                              )))
                    ]),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xffB7935F))),
              child: Text(
                "Arabic",
                style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  wordSpacing: 4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
