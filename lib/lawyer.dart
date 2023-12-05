import 'package:flutter/material.dart';


class lawyer extends StatefulWidget {
  const lawyer({super.key});

  @override
  State<lawyer> createState() => _lawyerState();
}

class _lawyerState extends State<lawyer> {
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
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 40),
                child: Text(
                  "Register New Lawyer",
                  style: TextStyle(fontSize: 40, fontFamily: "Acme", color: Color(0xffffd439)),
                ),
              ),
              Center(
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: 340, // Adjusted height
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Fill your details:",
                          style: TextStyle(fontSize: 15, fontFamily: "Acme"),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Name',
                              hintStyle: TextStyle(fontFamily: "Acme"),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            maxLines: 8,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                              hintStyle: TextStyle(fontFamily: "Acme"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // print('Selected Filters: $selectedFilters');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(fontFamily: "Acme", color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffffd439)
                            ),
                          ),
                        ),
                      ],
                    ),
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
