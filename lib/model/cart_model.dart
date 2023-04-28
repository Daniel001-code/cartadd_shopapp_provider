import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of item
  final List _shopItems = [
    // [itemName itemPrice imagePath color]
    ['Rice bowl', '18', 'assets/food1(1).jpg', Colors.pink],
    ['Spring bowl', '15', 'assets/food2(1).jpg', Colors.green],
    ['Avocado bowl', '10', 'assets/food3.jpeg', Colors.orange],
    ['Meat bowl', '30', 'assets/food4.jpeg', Colors.blue],
    ['Noodles bowl', '10', 'assets/food5.jpeg', Colors.brown],
    ['Fish bowl', '30', 'assets/food6.jpg', Colors.red],
    ['Indian bowl', '10', 'assets/food7.jpeg', Colors.grey],
  ];
  List _cartItems = [];
  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
