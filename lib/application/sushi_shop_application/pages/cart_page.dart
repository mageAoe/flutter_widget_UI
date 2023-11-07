import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/components/button.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/food.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/shop.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context){
    // get access to shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context,value,child)=> Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text('My Cart'),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // customer cart 
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index){
                  // get food from cart 
                  final Food food = value.cart[index];
                  
                  // get food name
                  final String foodName = food.name;
                  
                  // get food price
                  final String foodPrice  = food.price;
            
                  // return list title
                  return Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    margin: const EdgeInsets.only(left: 20,top: 20,right: 20),
                    child: ListTile(
                      title: Text(foodName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Text(foodPrice, style: TextStyle(color: Colors.grey[200])),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context), icon: Icon(Icons.delete, color: Colors.grey[200])),
                    ),
                  );
                }
              ),
            ),

            
            // pay button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: 'Pay Now', onTap: (){}),
            )

          ],
        ),
      )
    );
  }
}