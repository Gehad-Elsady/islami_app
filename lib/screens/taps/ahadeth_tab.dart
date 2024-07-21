import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/ahadeth-details_provider.dart';
import 'package:islami_app/screens/details/hadeth-details.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AhadethDetailsProvider()..loadAhadethFile(),
      builder: (context, child) {
        var ahadeth = Provider.of<AhadethDetailsProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/ahadeth-bg.png",
              height: 219,
            ),
            Divider(),
            Text(
              "ahadeth".tr(),
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
                      Navigator.pushNamed(
                        context,
                        HadethDetailsScreen.routeName,
                        arguments: ahadeth.allAhadeth[index],
                      );
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      ahadeth.allAhadeth[index].title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                },
                itemCount: ahadeth.allAhadeth.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
