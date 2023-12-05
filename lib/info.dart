import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class info extends StatefulWidget {
  const info({Key? key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>>? _wordData;
  String? input;

  Future<void> _fetchWordData(String? word) async {
    final response = await http.get(Uri.parse('https://ipc-find.vercel.app/api?q=$word'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      if (responseData.isNotEmpty) {
        setState(() {
          _wordData = responseData.cast<Map<String, dynamic>>();
        });
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

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
                  "IPC LookUps",
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
                    controller: controller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Eg 300 or Murder Case",
                      hintStyle: TextStyle(fontFamily: "Acme"),
                      focusColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            input = controller.text;
                            _fetchWordData(input);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              _wordData == null
                  ? Center(
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/judge.png',
                    width: 400,
                    height: 400,
                  ),
                ),
              )
                  : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    _wordData!.first['section_content'] as String,
                    style: TextStyle(fontFamily: "Acme",fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
