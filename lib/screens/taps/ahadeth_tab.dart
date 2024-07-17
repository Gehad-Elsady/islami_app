import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screens/details/hadeth-details.dart';
import 'package:islami_app/models/hadeth-model.dart';

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
        Divider(),
        Text(
          "Ahadeth",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
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
                  style: Theme.of(context).textTheme.headlineSmall,
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
