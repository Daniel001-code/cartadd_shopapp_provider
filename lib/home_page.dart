import 'package:cartadd_shopapp/Cart_page.dart';
import 'package:cartadd_shopapp/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'components/food_item_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartPage();
            }));
          },
          child: Icon(Icons.shopping_bag),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                      elevation: 0,
                      color: Colors.black,
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Welcome esteemed member,',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Let's cook fresh \nmeal for you",
                  style: GoogleFonts.notoSerif(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  'Available meals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                  child: Consumer<CartModel>(builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
                    ),
                    itemBuilder: (context, index) {
                      return foodItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    });
              })),
            ],
          ),
        ),
      ),
    );
  }
}
