import 'package:cartadd_shopapp/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class introPage extends StatefulWidget {
  @override
  State<introPage> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //logo
            AspectRatio(
              child: Image.asset(
                'assets/logo1.jpg',
              ),
              aspectRatio: 1,
            ),

            //we deliver food at your door step
            Text(
              'We deliver \n food at your\n doorstep',
              style: GoogleFonts.notoSerif(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            //cooked when ordered
            Text(
              'Cooked when ordered',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color.fromARGB(252, 116, 113, 113),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Text(
                'Get started',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(0),
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 151, 19, 9)),
                minimumSize: MaterialStatePropertyAll(Size(100, 50)),
              ),
            ),
            Spacer(),
            //get started botton
          ],
        ),
      ),
    );
  }
}
