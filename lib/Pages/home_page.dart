import 'package:flutter/material.dart';
import 'package:tutorial/Pages/my-drawer.dart';

class HomePage extends StatelessWidget {
  var text = "Home Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rohit's App"),
      ),
      body: Center(
        child: Container(
          child: Text(text),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
