import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    ThemeMode currentThemeMode =
        Theme.of(context).brightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;
    String img = selectedImage(currentThemeMode);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadSuraFile(model.index);
    }

    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(img), fit: BoxFit.fitHeight)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.name),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: Card(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text("(*)${verses[index]}",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.headlineMedium);
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");

    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    setState(() {});
  }

  String selectedImage(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return "assets/images/bg3.png";
    } else {
      return "assets/images/bg-dark.png";
    }
  }
}
