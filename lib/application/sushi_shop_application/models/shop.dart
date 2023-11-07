import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/food.dart';

class Shop extends ChangeNotifier{

  final  List<Food> _foodMenu = [
      // salmon sushi
      Food(name: 'Salmon Sushi', price: '21.00', imagePath: 'lib/images/sushi_three.png', rating: '4.9'),
      // tuna
      Food(name: 'Tuna', price: '23.00', imagePath: 'lib/images/sushi_two.png', rating: '4.3')
  ];

  // customer cart
  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem,int quantity){
    for (var i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }

}