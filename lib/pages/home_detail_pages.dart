import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  //const HomeDetailPage({Key? key}) : super(key: key);
  final Item Catalog;
  final Item catalog;

  const HomeDetailPage({Key? key, required this.Catalog, required this.catalog})
      : assert(Catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${Catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add To Cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Hero(
            //       tag: Key(Catalog.id.toString()),
            //       child: Expanded(child: Image.network(Catalog.image)),
            //     ).p64(),

            Expanded(
                child: Hero(
                    tag: Key(catalog.id.toString()),
                    child: Material(
                        type: MaterialType.transparency,
                        child: Image.network(Catalog.image).p4()))),

            Expanded(
                child: VxArc(
                    height: 30,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          // Catalog.name.text.xl4.bold
                          //     .color(MyTheme.darkBluish)
                          //     .make(),
                          Text(
                            Catalog.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.darkBluish,
                            ),
                            textScaleFactor: 2.25,
                          ),
                          // Catalog.desc.text.xl.make(),
                          Text(
                            Catalog.desc,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyTheme.darkBluish,
                            ),
                            textScaleFactor: 1.25,
                          ),
                          10.heightBox,
                          Expanded(
                              child: SingleChildScrollView(
                            child: Text(
                              'Dolores diam amet sea labore ut. Rebum clita amet ipsum voluptua amet elitr et at, eos amet dolore elitr et, dolor sit diam sea consetetur justo. Labore vero ut tempor magna sit aliquyam vero, sit justo stet et gubergren takimata ipsum ut. Eos dolor ut lorem sea eirmod consetetur eos,.',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ).p16())
                        ],
                      ).py32(),
                    )))
          ],
        ),
      ),
    );

    ;
    ;
  }
}
