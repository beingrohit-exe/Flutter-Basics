// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tutorial/Modals/catalog.dart';
import 'package:tutorial/Pages/home-details.dart';
import 'package:tutorial/Widgets/add-to-cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogItems.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogItems.items[index];
        return CatalogModal(catalog: catalog);
      },
    );
  }
}

class CatalogModal extends StatelessWidget {
  final Item catalog;

  const CatalogModal({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetails(catalog: catalog),
        ),
      ),
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              SizedBox(
                height: 10,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog)
                ],
              )
            ],
          ))
        ],
      ),
    )).color(Theme.of(context).cardColor).rounded.square(140).make().py16();
  }
}


class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(context.canvasColor)
        .p4
        .rounded
        .make()
        .p16()
        .w40(context);
  }
}
