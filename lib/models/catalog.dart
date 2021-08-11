class CatalogModel{
  static final items = [Item(
  id: 1,
  name: "iPhone 12",
  description: "Iphone",
  price: 999,
  color: "#33505a",
  image: "https://static.digit.in/default/2b414a3f6852a8c1c8b9b5d0bb60d5779cf377ce.jpeg?tr=n-product_detail_leader_thumb",
)];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });
}


