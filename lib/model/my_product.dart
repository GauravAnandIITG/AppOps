import "product.dart";

class MyProduct{
  static List<Product> vegetable=[
    Product(id: 1, name: "Carrot", category: "vegetable", price: 50, image: "assests/products/carrot.jpg", quantity: 1),
    Product(id: 2, name: "Broccoli", category: "vegetable", price: 80, image: "assests/products/broccoli.jpg", quantity: 1),
    Product(id: 3, name: "Potatoes", category: "vegetable", price: 40, image: "assests/products/potatoes.png", quantity: 1),
    Product(id: 4, name: "Brinjal", category: "vegetable", price:60, image: "assests/products/brinjal.jpg", quantity: 1),
    Product(id: 5, name: "Mushroom", category: "vegetable", price: 70, image: "assests/products/white-mushrooms-isolated-piece-burlap.png", quantity: 1),
    Product(id: 6, name: "Onion", category: "vegetable", price: 55, image: "assests/products/onion.png", quantity: 1),

  ];
  static List<Product> fruit=[
    Product(id: 1, name: "Apple", category: "fruit", price: 100, image: "assests/products/apple.png", quantity: 1),
    Product(id: 2, name: "Guava", category: "fruit", price: 80, image: "assests/products/Guava.jpg", quantity: 1),
    Product(id: 3, name: "Kiwi", category: "fruit", price: 120, image: "assests/products/kivi.jpg", quantity: 1),
    Product(id: 4, name: "Watermelon", category: "fruit", price: 50, image: "assests/products/watermelon.png", quantity: 1),
    Product(id: 5, name: "PineApple", category: "fruit", price: 90, image: "assests/products/pineapple.png", quantity: 1),
    Product(id: 6, name: "Mango", category: "fruit", price: 50, image: "assests/products/mango.png", quantity: 1)
  ];
}