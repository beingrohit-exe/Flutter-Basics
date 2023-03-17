class CatalogItems {

  // //Singleton class
  // static final catModal = CatalogItems._internal();
  // CatalogItems._internal();
  // factory CatalogItems() => catModal;

  // static List<Item>? items;
  static List<Item> items = [];

  //Get item by Id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get item by Position
  Item getByPosition(int index) => items[index];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

/**
 * This is used to convert JSON object to Dart object
 */
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
