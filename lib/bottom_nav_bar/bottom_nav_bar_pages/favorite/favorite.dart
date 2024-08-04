import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_data.dart';
import '../home/widgets/food_cards/data.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorilerim'),
      ),
      body: Consumer<FavoriteState>(
        builder: (context, favoriteState, _) {
          List<FoodModel> favoriteItems = favoriteState.favorites.toList();

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final foodItem = favoriteItems[index]; // foodItem'ı tanımladık

              return ListTile(
                title: Text(foodItem.name),
                subtitle: Text(foodItem.explanation),
                trailing: SizedBox(
                  width: 96, // Row widget'ın genişliğini sınırla
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .end, // Row içindeki ikonları sağa hizala
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          Provider.of<CartState>(context, listen: false)
                              .addToCart(foodItem); // foodItem'ı kullanıyoruz
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () {
                          favoriteState.toggleFavorite(
                              foodItem); // foodItem'ı kullanıyoruz
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
