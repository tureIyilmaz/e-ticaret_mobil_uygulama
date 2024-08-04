import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final ImageProvider icon;
  bool active;

  // ignore: non_constant_identifier_names
  CategoryModel.CategoryItem(
      {required this.name, required this.icon, this.active = false});
}

List<CategoryModel> categoryData = [
  CategoryModel.CategoryItem(
    name: "Pizza",
    icon: const AssetImage('assets/img/food_category/pizza.png'),
    active: true,
  ),
  CategoryModel.CategoryItem(
    name: "Sos",
    icon: const AssetImage('assets/img/food_category/sos.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Tatlı",
    icon: const AssetImage('assets/img/food_category/sweet.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "İçecek",
    icon: const AssetImage('assets/img/food_category/drinks.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Çorba",
    icon: const AssetImage('assets/img/food_category/soup.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Ana Yemek",
    icon: const AssetImage('assets/img/food_category/main_courses.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Salata",
    icon: const AssetImage('assets/img/food_category/salad.png'),
    active: false,
  ),
  CategoryModel.CategoryItem(
    name: "Burger",
    icon: const AssetImage('assets/img/food_category/hamburger.png'),
    active: false,
  ),
];
