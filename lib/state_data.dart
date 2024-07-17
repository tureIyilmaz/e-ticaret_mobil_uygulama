import 'package:flutter/material.dart';

import 'bottom_nav_bar/bottom_nav_bar_pages/home/food_cards/data.dart'; // FoodModel erişimi için gerekli

class CartModel {
  final FoodModel foodItem;
  int quantity;

  CartModel({required this.foodItem, this.quantity = 1});
}

class CartState extends ChangeNotifier {
  int _counter = 0;
  List<CartModel> _cartItems = [];

  int get counter => _counter;
  List<CartModel> get cartItems => _cartItems;

  void addToCart(FoodModel foodItem) {
    bool itemExists = false;

    for (var item in _cartItems) {
      if (item.foodItem == foodItem) {
        itemExists = true;
        item.quantity++;
        break;
      }
    }

    if (!itemExists) {
      _cartItems.add(CartModel(foodItem: foodItem, quantity: 1));
    }
    _counter++;
    notifyListeners();
  }

  void decreaseFromCart(FoodModel foodItem) {
    for (var item in _cartItems) {
      if (item.foodItem == foodItem) {
        if (item.quantity > 1) {
          item.quantity--;
        } else {
          _cartItems.remove(item);
        }
        _counter--;
        break;
      }
    }
    notifyListeners();
  }

  void removeFromCart(FoodModel foodItem) {
    for (var item in _cartItems) {
      if (item.foodItem == foodItem) {
        _counter -= item.quantity;
        _cartItems.remove(item);
        break;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _counter = 0;
    notifyListeners();
  }
}

class FavoriteState extends ChangeNotifier {
  Set<FoodModel> _favorites = {};

  Set<FoodModel> get favorites => _favorites;

  void toggleFavorite(FoodModel foodItem) {
    if (_favorites.contains(foodItem)) {
      _favorites.remove(foodItem);
    } else {
      _favorites.add(foodItem);
    }
    notifyListeners();
  }

  bool isFavorite(FoodModel foodItem) {
    return _favorites.contains(foodItem);
  }
}
