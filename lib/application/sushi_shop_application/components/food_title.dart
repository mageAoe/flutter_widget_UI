import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  const FoodTitle({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          // image
          Image.asset(food.imagePath, height: 140),

          // text
          Text(food.name, style: GoogleFonts.dmSerifDisplay(fontSize: 20)),

          // price + rating
          SizedBox(
            width: 160,
            child: Row(
              children: [

                // price
                Text('\$${food.price}'),

                // rating
                const Icon(Icons.star),
                Text(food.rating)
              ],
            ),
          )
        ],
      ),
    );
  }
}