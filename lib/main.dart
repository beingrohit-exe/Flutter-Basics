import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          fontFamily: GoogleFonts.lato().fontFamily,
          //primary swatch is auto assigning colors based on color given
          //like if we give red color then it will give auto colors to all the properties
          primarySwatch: Colors.purple),

      //properties for dark theme
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/home",
      routes: {
        "/": (context) => HomePage(),
        "/home": (context) => LoginPage(),
      },
    );
  }
}
