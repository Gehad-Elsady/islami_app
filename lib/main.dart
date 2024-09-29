import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/bloc/observer.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/screens/details/hadeth-details.dart';
import 'package:islami_app/screens/home-page.dart';
import 'package:islami_app/screens/details/sura_details.dart';
import 'package:islami_app/theme/app-theme.dart';
import 'package:provider/provider.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: Locale("en"),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MyProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: provider.appTheme,
          theme: AppTheming.LightTheme,
          darkTheme: AppTheming.DarckTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => HomePage(),
            SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
            HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
          },
        );
      },
    );
  }
}
