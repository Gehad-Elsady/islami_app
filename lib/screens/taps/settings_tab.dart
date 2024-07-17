import 'package:flutter/material.dart';
import 'package:islami_app/theme/app-colors.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  // bool light = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Theme",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: AppColor.PraimaryColor,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Theme",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Light",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  value = !value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Light",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Switch(
                              value: false,
                              onChanged: (value) {
                                setState(() {
                                  value = !value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xffB7935F)),
              ),
              child: Text(
                "Light",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Language",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: AppColor.PraimaryColor,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Language",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Arabic",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  value = !value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "English",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Switch(
                              value: false,
                              onChanged: (value) {
                                setState(() {
                                  value = !value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColor.PraimaryColor),
              ),
              child: Text(
                "Arabic",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
