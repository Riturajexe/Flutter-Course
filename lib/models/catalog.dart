class item {
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });
}

final products = [item(
  id: "1",
  name: "iPhone 12",
  description: "Iphone",
  price: 999,
  color: "#33505a",
  image: "",
)];
