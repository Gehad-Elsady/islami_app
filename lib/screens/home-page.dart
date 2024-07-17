// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
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
    ThemeMode currentThemeMode =
        Theme.of(context).brightness == Brightness.light
            ? ThemeMode.light
            : ThemeMode.dark;
    String img = selectedImage(currentThemeMode);
    return Stack(
      children: [
        Image.asset(
          img,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/quran.png"),
                      size: 30,
                    ),
                    label: "Moshaf"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/sebha.png"),
                      size: 30,
                    ),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/radio.png"),
                      size: 30,
                    ),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/ahadeth.png"),
                      size: 30,
                    ),
                    label: "Ahadeth"),
                BottomNavigationBarItem(
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
  String selectedImage(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return "assets/images/bg3.png";
    } else {
      return "assets/images/bg-dark.png";
    }
  }
}
