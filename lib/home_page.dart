import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rohit's App"),
      ),
      body: Center(
        child: Container(
          child: Text("Rohit Parihar (Home Page)"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
