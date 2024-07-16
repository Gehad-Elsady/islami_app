import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/screens/taps/ahadeth_tab.dart';
import 'package:islami_app/screens/taps/quran_tab.dart';
import 'package:islami_app/screens/taps/radio_tab.dart';
import 'package:islami_app/screens/taps/sebha_tab.dart';
import 'package:islami_app/screens/taps/settings_tab.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'homepage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg3.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Islami",
              style: GoogleFonts.elMessiri(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              showUnselectedLabels: false,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xffB7935F),
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Color(0xffB7935F),
                    icon: ImageIcon(
                      AssetImage("assets/images/quran.png"),
                      size: 30,
                    ),
                    label: "Moshaf"),
                BottomNavigationBarItem(
                    backgroundColor: Color(0xffB7935F),
                    icon: ImageIcon(
                      AssetImage("assets/images/sebha.png"),
                      size: 30,
                    ),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    backgroundColor: Color(0xffB7935F),
                    icon: ImageIcon(
                      AssetImage("assets/images/radio.png"),
                      size: 30,
                    ),
                    label: "Radio"),
                BottomNavigationBarItem(
                    backgroundColor: Color(0xffB7935F),
                    icon: ImageIcon(
                      AssetImage("assets/images/ahadeth.png"),
                      size: 30,
                    ),
                    label: "Ahadeth"),
                BottomNavigationBarItem(
                    backgroundColor: Color(0xffB7935F),
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    label: "Settings"),
              ]),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
