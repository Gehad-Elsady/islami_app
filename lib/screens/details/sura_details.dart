import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/providers/sura_details_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<MyProvider>(context);
        var sura = Provider.of<SuraDetailsProvider>(context);

        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(provider.appTheme == ThemeMode.dark
                ? "assets/images/bg-dark.png"
                : "assets/images/bg3.png"),
            fit: BoxFit.fitHeight,
          )),
          child: Scaffold(
            appBar: AppBar(
              title: Text(model.name),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
              child: Card(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text("${sura.verses[index]} ($index )",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        style: Theme.of(context).textTheme.headlineMedium);
                  },
                  itemCount: sura.verses.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
