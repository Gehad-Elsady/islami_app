import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/screens/hadeth-details.dart';
import 'package:islami_app/screens/hadeth-model.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAhadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/ahadeth-bg.png",
          height: 219,
        ),
        Divider(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        Text(
          "Ahadeth",
          textAlign: TextAlign.center,
          style: GoogleFonts.elMessiri(
            fontSize: 25,
            wordSpacing: 4,
            fontWeight: FontWeight.w400,
          ),
        ),
        Divider(
          color: Color(0xffB7935F),
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Color(0xffB7935F),
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                      arguments: allAhadeth[index]);
                },
                child: Text(
                  textAlign: TextAlign.center,
                  allAhadeth[index].title,
                  style: GoogleFonts.inter(
                    fontSize: 25,
                    wordSpacing: 4,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            },
            itemCount: allAhadeth.length,
          ),
        ),
      ],
    );
  }

  void loadAhadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> ahadeth = value.split("#");
      for (int i = 0; i < ahadeth.length; i++) {
        String hadeth = ahadeth[i];
        List<String> hadethLine = hadeth.trim().split("\n");
        String title = hadethLine[0];
        hadethLine.removeAt(0);
        List<String> content = hadethLine;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }

      setState(() {});
    });
  }
}
