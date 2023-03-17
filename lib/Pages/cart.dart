import 'package:flutter/material.dart';
import 'package:tutorial/Modals/cart-modal.dart';
import 'package:tutorial/Utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(Theme.of(context).accentColor).bold.make(),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _CartList(),
          )),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl4
              .color(Theme.of(context).accentColor)
              .make(),
          WidthBox(40),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: "Not Supported".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).buttonColor)),
            child: "Buy".text.make(),
          ).w40(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Cart is Empty please add some items".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.check_box_rounded),
              trailing: IconButton(
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  setState(() {});
                },
                icon: Icon(Icons.remove),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
