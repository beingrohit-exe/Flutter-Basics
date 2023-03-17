import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/Core/my-store.dart';
import 'package:tutorial/Modals/cart-modal.dart';
import 'package:tutorial/Modals/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  //Using VxState instead of new object creation everytime
  // final _cart = CartModal();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    // VxState
    final CartModal _cart = (VxState.store as MyStore).cart;
    // final CatalogItems _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // isInCart = isInCart.toggle();
            // final _catalog = CatalogItems();

            // _cart.catalog = _catalog;
            // _cart.addItem(catalog);
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
