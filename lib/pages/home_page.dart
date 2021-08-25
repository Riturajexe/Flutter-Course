import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/widgets/drawer.dart';
import 'package:flutter_course/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,mainAxisSpacing: 16,crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items![index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(item.name,style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,

                      ),),
                      child: Image.network(item.image),
                      footer: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
                      decoration: BoxDecoration(
                        color: Colors.black,

                      ),),
                      ),
                    );
                
                },
                itemCount: CatalogModel.items!.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
