import 'package:flutter/material.dart';
import 'package:islami_app/screens/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routrName,
      routes: {
        HomePage.routrName: (context) => HomePage(),
      },
    );
  }
}
