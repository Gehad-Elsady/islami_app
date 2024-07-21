import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/bottom_sheets/language_bottomsheet.dart';
import 'package:islami_app/bottom_sheets/theme_bottomsheet.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/theme/app-colors.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "theme".tr(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor: Colors.white,
                builder: (context) {
                  return ThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xffB7935F)),
              ),
              child: provider.appTheme != ThemeMode.dark
                  ? Text(
                      "light".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  : Text(
                      "dark".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
            ),
          ),
          SizedBox(height: 40),
          Text(
            "language".tr(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                backgroundColor: Colors.white,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColor.PraimaryColor),
              ),
              child: context.locale == Locale("ar")
                  ? Text(
                      "arabic".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  : Text(
                      "english".tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
