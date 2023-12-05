import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.number
  });

  final String name, number;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white24,
        child: Icon(
          CupertinoIcons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Belanosima"
        ),
      ),
      subtitle: Text(
        number,
        style: TextStyle(
            color: Colors.white,
            fontFamily: "Belanosima"
        ),
      ),
    );
  }
}