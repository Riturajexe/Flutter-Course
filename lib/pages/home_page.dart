import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/pages/home_detail_pages.dart';
import 'package:flutter_course/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/widgets/drawer.dart';
import 'package:flutter_course/widgets/item_widget.dart';
import 'package:flutter_course/widgets/themes.dart';

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
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, MyRoutes.CartRoute), child:Icon(CupertinoIcons.cart,color: Colors.white,),backgroundColor: context.theme.buttonColor),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 0,left:8 ,right:8 ,top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl2.make()
      ],
    ).p0();
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: CatalogModel.items!.length,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items![index];
            return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailPage(
                              
                              //Catalog: CatalogModel.getById(2),
                              Catalog: catalog,
                              catalog: catalog,
                            ))),
                child: CatalogItem(catalog: catalog));
          }),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      
      child: Hero(
        tag: Key(catalog.id.toString()),
        child: Material(
          type: MaterialType.transparency,
          child: Row(
            
            
            children: [
              Padding(padding: EdgeInsets.zero),
              CatalogImage(image: catalog.image),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.bold.lg.color(context.accentColor).make(),
                  catalog.desc.text.medium.make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(context.theme.buttonColor),
                              shape: MaterialStateProperty.all(StadiumBorder())),
                          child: "Add To Cart".text.make())
                    ],
                  ).pOnly(right: 8.0)
                ],
              ))
            ],
          ),
        ),
      ),
    ).color(context.cardColor).rounded.square(150).make().pOnly(top: 8.0,bottom: 8.0,left: 0,right: 0);
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
