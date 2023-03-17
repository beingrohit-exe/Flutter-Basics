import 'package:flutter/material.dart';
import 'package:tutorial/Core/my-store.dart';
import 'package:tutorial/Pages/cart.dart';
import 'package:tutorial/Pages/home_page.dart';
import 'package:tutorial/Pages/login_page.dart';
import 'package:tutorial/Utils/Routes.dart';
import 'package:tutorial/Utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp()));
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
