import 'package:flutter/material.dart';

class fav extends StatefulWidget {
  const fav({super.key});

  @override
  State<fav> createState() => _favState();
}

class _favState extends State<fav> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 50),
                child: Text(
                  "BookMarked",
                  style: TextStyle(fontSize: 50, fontFamily: "Acme", color: Color(0xffffd439)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Enter name of the lawyer",
                      hintStyle: TextStyle(fontFamily: "Acme"),
                      focusColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.black), // Border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.black), // Focused border color
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.black, // Icon color
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50),
              Center(
                child: Opacity(
                  opacity: 0.7, // Set the opacity value between 0.0 and 1.0
                  child: Image.asset(
                    'assets/bm1.png', // Make sure to replace with your actual image path
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
