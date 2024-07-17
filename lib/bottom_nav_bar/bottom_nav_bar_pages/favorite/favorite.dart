import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state_data.dart';
import '../home/food_cards/data.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

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
              return ListTile(
                title: Text(favoriteItems[index].name),
                subtitle: Text(favoriteItems[index].explanation),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    favoriteState.toggleFavorite(favoriteItems[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
