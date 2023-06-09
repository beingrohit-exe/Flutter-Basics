// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tutorial/Core/my-store.dart';
import 'package:tutorial/Modals/catalog.dart';
import 'package:tutorial/Widgets/catalog-list.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModal {
  // //Singleton class
  // static final cartModal = CartModal._internal();
  // CartModal._internal();
  // factory CartModal() => cartModal;

  //Catalog Field
  late CatalogItems _catalog;

  //List of CatalogItems id
  final List<int> _itemId = [];

//Getter
  CatalogItems get catalog => _catalog;

//Setter
  set catalog(CatalogItems newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//Get items in the Cart
  List<Item> get items => _itemId.map((e) => _catalog.getById(e)).toList();

  //Get total price of Items
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  //Add items to the Cart
  void addItem(Item item) {
    _itemId.add(item.id);
  }

  //Remove item from Cart
  void remove(Item item) {
    _itemId.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemId.add(item.id);
  }
}

class RemoveMutation extends VxMutation {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    (VxState.store as MyStore).cart._itemId.remove(item.id);
  }
}
