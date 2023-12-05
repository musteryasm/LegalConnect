import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class law extends StatefulWidget {
  const law({Key? key}) : super(key: key);

  @override
  State<law> createState() => _lawState();
}

class _lawState extends State<law> {
  stt.SpeechToText _speech = stt.SpeechToText();
  TextEditingController controller = TextEditingController();
  bool isRecording = false;
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    initializeSpeech();
  }

  void initializeSpeech() async {
    bool available = await _speech.initialize();
    if (!available) {
      print('The user denied access to the microphone');
    }
  }

  void startRecording() async {
    if (_speech.isListening) {
      setState(() {
        controller.text = ''; // Reset text field if already recording
      });
      return;
    }

    setState(() {
      isRecording = true;
    });

    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            controller.text = result.recognizedWords;
          });
        },
        onSoundLevelChange: (level) {
          // Use level for displaying a beating animation
        },
        cancelOnError: true,
      );
    }
  }

  void stopRecording() {
    if (_speech.isListening) {
      _speech.stop();
    }
    setState(() {
      isRecording = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _speech.cancel();
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
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 20),
                child: Text(
                  "Find",
                  style: TextStyle(fontSize: 50, fontFamily: "Acme", color: Color(0xffffd439)),
                ),
              ),
              Center(
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: 340, // Adjusted height
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              "Get Your Lawyer",
                              style: TextStyle(fontSize: 40, fontFamily: "Acme", fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Describe your case so that we can suggest you the best attorney!",
                            style: TextStyle(fontSize: 15, fontFamily: "Acme"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: controller,
                            maxLines: 6,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter your case description...',
                              hintStyle: TextStyle(fontFamily: "Acme"),
                            ),
                            style: TextStyle(fontFamily: "Acme"),
                          ),
                        ),
                        SizedBox(height: 20),
                        IconButton(
                          icon: Icon(
                            isRecording ? Icons.mic_none : Icons.mic,
                            color: Colors.black,
                          ),
                          onPressed: isRecording ? stopRecording : startRecording,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(right: 75),
                          child: Text("Apply filter to find your perfect attorney:",style: TextStyle(fontFamily: "Acme"),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter comma seprated filter',
                              hintStyle: TextStyle(fontFamily: "Acme"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // print('Selected Filters: $selectedFilters');
                            },
                            child: Text(
                              'Find Lawyer',
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

