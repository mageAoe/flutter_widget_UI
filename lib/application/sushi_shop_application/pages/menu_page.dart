import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/components/button.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/components/food_title.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/models/food.dart';
import 'package:flutter_widget_ui/application/sushi_shop_application/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {


  // food menu
  List foodMenu = [
    // salmon sushi
    Food(name: 'Salmon Sushi', price: '21.00', imagePath: 'lib/images/sushi_three.png', rating: '4.9'),
    // tuna
    Food(name: 'Tuna', price: '23.00', imagePath: 'lib/images/sushi_two.png', rating: '4.3')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text('Tokyo', style: TextStyle(color: Colors.grey[900])),
      ),
      body: Column(
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // promo message
                      Text('Get 32% Promo', style:GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white
                      )),

                      const SizedBox(height: 20),
                      
                      // redeem button
                      MyButton(text: 'Redeem', onTap: (){

                      })
                    ],
                  ),

                  // image
                  Image.asset('lib/images/sushi.png', height: 100)
                ]
              ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ),

          const SizedBox(height: 25),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18
              ),
            ),
          ),

          const SizedBox(height: 25),

          Expanded(
            child: ListView.builder(
              itemCount: foodMenu.length,
              itemBuilder: ((context, index) => 
                FoodTitle(food: foodMenu[index])
              )
            )
          )

          // popular food

        ],
      ),
    );
  }
}