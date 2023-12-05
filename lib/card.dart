import 'package:flutter/material.dart';

class card extends StatefulWidget {
  final String name;
  final String experience;
  final String fees;
  final String expertise;
  final String reviews;
  final String gender;
  final String probono;
  final String language;
  final String location;
  final String demographics;

  card({
    required this.name,
    required this.experience,
    required this.fees,
    required this.expertise,
    required this.reviews,
    required this.gender,
    required this.probono,
    required this.language,
    required this.location,
    required this.demographics,
  });

  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${widget.name}", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
              Text("Experience: ${widget.experience} years", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
              Text("Fees: ₹${widget.fees}", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
              Text("Expertise: ${widget.expertise}", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
              Text("Reviews: ${widget.reviews} star", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
            ],
          ),
        ),
        children: [
          Text("Gender: ${widget.gender}", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
          Text("Probono: ${widget.probono} ", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
          Text("language: ${widget.language}", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
          Text("Location: ${widget.location}", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
          Text("Demographics: ${widget.demographics} star", style: TextStyle(fontFamily: "Acme", fontSize: 25)),
        ],
      ),
    );
  }
}
