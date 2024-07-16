import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"),
              fit: BoxFit.fitHeight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(size: 30, color: Colors.black),
          title: Text(
            model.name,
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: Card(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  "(*)${verses[index]}",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  // int x=5+7;
  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    // 5.5.5.5.5.5.5
    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    print(suraLines);
    setState(() {});
  }
}
