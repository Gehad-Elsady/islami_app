import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/hadeth-model.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetails";

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
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
            model.title,
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
                  model.content[index],
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                );
              },
              itemCount: model.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
