import 'package:flutter/material.dart';
import 'package:tutorial/Pages/home_page.dart';
import 'package:tutorial/Pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),

      // Only theme mode not works because we have to give properties of it
      themeMode: ThemeMode.light,

      //properties for light theme
      theme: ThemeData(
          //primary swatch is auto assigning colors based on color given
          //like if we give red color then it will give auto colors to all the properties
          primarySwatch: Colors.purple),

      //properties for dark theme
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
