import 'package:flutter/material.dart';
import 'package:islami_app/models/hadeth-model.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetails";

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.appTheme == ThemeMode.dark
                  ? "assets/images/bg-dark.png"
                  : "assets/images/bg3.png"),
              fit: BoxFit.fitHeight)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: Card(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(model.content[index],
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headlineMedium);
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
