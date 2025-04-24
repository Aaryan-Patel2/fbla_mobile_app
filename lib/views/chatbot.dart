import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:fbla_mobile_app/widgets/buttons.dart';
import 'package:fbla_mobile_app/core/routes/app_routes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  String aiImagePath = "assets/response.png"; // Path to AI response image

  void sendMessage(String message) {
    setState(() {
      messages.add({"sender": "user", "text": message});
    });

    if (message.trim().toLowerCase() == "what is the meaning of life?") {
      setState(() {
        messages.add({"sender": "ai", "text": "..."});
      });

      Future.delayed(Duration(seconds: 2), () {
        String aiResponse =
            "That’s one of the big questions! Some say it’s about finding happiness, others believe it’s about personal growth, relationships, or leaving a legacy. From a scientific perspective, life is about survival and reproduction. Philosophically, it depends on your beliefs—existentialists say we create our own meaning, while some religions see it as fulfilling a divine purpose.";

        setState(() {
          messages.removeLast(); // Remove the "..." message
          messages.add({"sender": "ai", "text": aiResponse});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blue.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      bool isUser = message["sender"] == "user";

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: BubbleSpecialOne(
                          text: message["text"]!,
                          isSender: isUser,
                          color: isUser ? Colors.blue : Colors.grey.shade800,
                          textStyle: TextStyle(color: Colors.white),
                          sent: true,
                          seen: true,
                          tail: true,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 70.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Type a message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            sendMessage(_controller.text);
                            _controller.clear();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Home Button Positioned at the Bottom Left
          Positioned(
            bottom:
                10, // Adjust this for fine-tuning (5-10 pixels above the bottom)
            left: 0,
            right: 0,
            child: Center(
              child: ReturnToHomeButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.testHomeScreen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
