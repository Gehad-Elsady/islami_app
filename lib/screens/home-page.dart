// ignore_for_file: unrelated_type_equality_checks

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/screens/taps/ahadeth_tab.dart';
import 'package:islami_app/screens/taps/quran_tab.dart';
import 'package:islami_app/screens/taps/radio_tab.dart';
import 'package:islami_app/screens/taps/sebha_tab.dart';
import 'package:islami_app/screens/taps/settings_tab.dart';
import 'package:provider/provider.dart';

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
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.appTheme == ThemeMode.light
              ? "assets/images/bg3.png"
              : "assets/images/bg-dark.png",
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'islami'.tr(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/quran.png"),
                  size: 30,
                ),
                label: 'moshaf-navigation'.tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/sebha.png"),
                  size: 30,
                ),
                label: "sebha-navigation".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/radio.png"),
                  size: 30,
                ),
                label: "radio-navigation".tr(),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/images/ahadeth.png"),
                  size: 30,
                ),
                label: "ahadeth-navigation".tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: "settings-navigation".tr(),
              ),
            ],
          ),
          body: tabs[selectedIndex],
          backgroundColor:
              Colors.transparent, // Make scaffold background transparent
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
