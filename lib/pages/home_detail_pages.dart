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
                    child: "Buy".text.make())
                .wh(100, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body:SafeArea(
          bottom: false,
          child:Column(
              children: [
                // Hero(
                //       tag: Key(Catalog.id.toString()),
                //       child: Expanded(child: Image.network(Catalog.image)),
                //     ).p64(),
                
                   
                      Expanded(child: Hero(tag: Key(catalog.id.toString()),
                      child: Image.network(Catalog.image).p4())),
                
                
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
                              Catalog.name.text.xl4.bold
                                  .color(MyTheme.darkBluish)
                                  .make(),
                              Catalog.desc.text.xl.make(),
                              10.heightBox,
                            ],
                          ).py64(),
                        )))
              ],
            ),
          
        ),
      
    );
    ;
  }
}
