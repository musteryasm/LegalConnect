import 'package:flutter/material.dart';
import 'package:law/card.dart';
import 'package:law/register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  'Welcome to lawYantra',
                  style: TextStyle(fontSize: 24,fontFamily: "Acme"),
                ),
                Text(
                  'Login here',
                  style: TextStyle(fontSize: 18,fontFamily: "Acme"),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                        hintStyle: TextStyle(fontFamily: "Acme"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                        hintStyle: TextStyle(fontFamily: "Acme"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontFamily: "Acme"),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffffd439),
                  ),
                  onPressed: () {
                    // Add login logic here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text('Login',style: TextStyle(fontFamily: "Acme"),),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => register()), // Navigate to login page
                    );
                  },
                  child: Text(
                    "Already have an account? Click here",
                    style: TextStyle(color: Colors.black, fontFamily: "Acme"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
