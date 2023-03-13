import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial/Modals/catalog.dart';
import 'package:tutorial/Pages/my-drawer.dart';
import 'package:tutorial/Widgets/my-widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text = "Home Page";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("Assets/Files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogItems.items =
        List.of(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(50, (index) => CatalogItems.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Electronic Store"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: (CatalogItems.items != null && CatalogItems.items.isNotEmpty)
            ? ListView.builder(
                //itemCount: CatalogItems.items.length,
                itemCount: CatalogItems.items.length,
                itemBuilder: (context, index) {
                  return MyWidget(
                    // item: CatalogItems.items[index],
                    item: CatalogItems.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
