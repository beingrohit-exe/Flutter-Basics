import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorial/Pages/cart.dart';
import 'package:tutorial/Pages/home_page.dart';
import 'package:tutorial/Pages/login_page.dart';
import 'package:tutorial/Utils/Routes.dart';
import 'package:tutorial/Utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),

      // Only theme mode not works because we have to give properties of it
      themeMode: ThemeMode.system,

      //properties for light theme
      theme: MyTheme.lightTheme(context),

      //properties for dark theme
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => Cart()
      },
    );
  }
}
