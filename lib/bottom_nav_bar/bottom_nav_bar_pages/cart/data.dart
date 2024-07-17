import '../home/food_cards/data.dart';

class CartModel {
  final FoodModel foodItem;
  int quantity;

  CartModel({required this.foodItem, this.quantity = 1});
}

List<CartModel> cartItems = [];
