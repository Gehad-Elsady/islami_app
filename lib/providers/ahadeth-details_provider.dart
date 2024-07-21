import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadeth-model.dart';

class AhadethDetailsProvider extends ChangeNotifier {
  List<HadethModel> allAhadeth = [];

  loadAhadethFile() {
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
      notifyListeners();
    });
  }
}
