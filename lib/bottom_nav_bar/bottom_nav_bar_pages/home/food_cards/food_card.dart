import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../state_data.dart';
import 'data.dart';

// ignore: must_be_immutable
class FoodCard extends StatefulWidget {
  final FoodModel foodItem;

  FoodCard({
    super.key,
    required this.foodItem,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    FavoriteState favoriteState = Provider.of<FavoriteState>(context);

    int discountedPrice = (widget.foodItem.price * 0.9).toInt();
    bool isFavorite = favoriteState.isFavorite(widget.foodItem);

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 25, 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.grey[50],
        child: ListTile(
          minVerticalPadding: 20,
          leading: SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(360),
              child: widget.foodItem.icon,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.foodItem.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  favoriteState.toggleFavorite(widget.foodItem);
                },
                icon: isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.foodItem.explanation,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (widget.foodItem.discount) ...[
                      Text(
                        'Fiyat: ${widget.foodItem.price.toStringAsFixed(2)} TL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${discountedPrice.toStringAsFixed(0)} TL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ] else ...[
                      Text(
                        'Fiyat: ${widget.foodItem.price.toStringAsFixed(2)} TL',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Provider.of<CartState>(context, listen: false)
                  .addToCart(widget.foodItem);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: const Size(36, 36),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
