import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/models/catalog.dart';
import 'dart:convert';
import 'package:flutter_course/widgets/drawer.dart';
import 'package:flutter_course/widgets/item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Rituraj";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.white,
          // elevation: 0.0,
          // iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Scaffold App",
            style: TextStyle(
              fontFamily: GoogleFonts.pacifico().fontFamily,
            ),
          ),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return itemWidget(
                item: dummyList[index],
              );
            },
          ),
        ));
  }
}
