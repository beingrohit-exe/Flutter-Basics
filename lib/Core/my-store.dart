// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:tutorial/Modals/cart-modal.dart';
import 'package:tutorial/Modals/catalog.dart';

class MyStore extends VxStore {
  late CatalogItems catalog;
  late CartModal cart;

  MyStore() {
    catalog = CatalogItems();
    cart = CartModal();
    cart.catalog = catalog;
  }
}
