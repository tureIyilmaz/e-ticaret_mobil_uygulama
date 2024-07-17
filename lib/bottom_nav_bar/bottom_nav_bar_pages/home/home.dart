// home.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'app_bar/home_app_bar.dart';
import 'catogory/food_category.dart';
import 'food_cards/data.dart';
import 'food_cards/food_card.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onToggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int notificationNumber = 0;
  String locationAddress = 'Your Location Address';
  String selectedCategory = "Pizza";

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _onFavoriteChanged(FoodModel foodItem, bool isFavorite) {
    setState(() {
      foodItem.isFavorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FoodModel> filteredFoodData = foodData
        .where((foodItem) => foodItem.categoryName == selectedCategory)
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: HomeAppBar(
          notificationCount: notificationNumber,
          onToggleTheme: widget.onToggleTheme,
          isDarkMode: widget.isDarkMode,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ImageCarousel(),
            FoodCategory(onCategorySelected: _onCategorySelected),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFoodData.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    foodItem: filteredFoodData[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        buildImageContainer(
          const AssetImage('assets/img/courusel/1.png'),
        ),
        buildImageContainer(
          const AssetImage('assets/img/courusel/2.png'),
        ),
        buildImageContainer(
          const AssetImage('assets/img/courusel/3.png'),
        ),
      ],
      options: CarouselOptions(
        height: 180,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        reverse: true,
      ),
    );
  }

  Widget buildImageContainer(ImageProvider imageProvider) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
