import 'package:cartadd_shopapp/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            iconSize: 20,
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        value.cartItems[index][2],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  value.cartItems[index][0],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                  '\$' + value.cartItems[index][1],
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      return Provider.of<CartModel>(context,
                                              listen: false)
                                          .removeItemFromCart(index);
                                    },
                                    icon: Icon(Icons.cancel)),
                              ),
                            ),
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '\$' + value.calculateTotal(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
