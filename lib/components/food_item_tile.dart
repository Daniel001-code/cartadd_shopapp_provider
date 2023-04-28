import 'package:flutter/material.dart';

class foodItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;
  foodItemTile({
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 77, 73, 73)),
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Text(
              itemName,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                '\$' + itemPrice,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
