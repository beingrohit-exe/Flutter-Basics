import 'package:flutter/material.dart';
import 'package:tutorial/Modals/catalog.dart';
import 'package:tutorial/Utils/themes.dart';
import 'package:tutorial/Widgets/add-to-cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
          ).h32(context).p16(),
          Expanded(
              child: VxArc(
            height: 40,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: Theme.of(context).cardColor,
              width: context.screenWidth,
              child: Column(children: [
                catalog.name.text.xl4.color(context.accentColor).bold.make(),
                catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                10.heightBox,
                "Diam et voluptua kasd vero takimata duo magna sed ipsum, ea sit erat erat diam et sed eirmod diam aliquyam, justo et magna dolor consetetur dolor dolore amet sit sea. Dolor ut diam clita elitr justo. Rebum sadipscing ut ut et lorem et. Consetetur diam erat labore et sanctus voluptua, et diam nonumy et sit dolor, diam sit duo tempor erat et sed takimata sed at. Justo kasd sanctus ipsum."
                    .text
                    .textStyle(context.captionStyle)
                    .make()
                    .p16(),
              ]).py64(),
            ),
          ))
        ]),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 7),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.red700.xl2.make(),
              AddToCart(
                catalog: catalog,
              ).wh(150, 50)
            ],
          ),
        ),
      ),
    );
  }
}
