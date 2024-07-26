class Product{
  final int id;
  final String name;
  final String category;
  final String image;
  final double price;
  int quantity;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.quantity,
  });
  toJson(){
    return{
      "name": name,
      "category": category,
      "image":image,
      "price": price,
      "quantity":quantity
    };
  }
}