import 'package:flutter/material.dart';

class PersonalRecordsCard extends StatelessWidget {
  const PersonalRecordsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Answers Correct:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          SizedBox(height: 12),
          Text("1. 8 - Asteroid", style: TextStyle(fontSize: 18, color: Colors.black87)),
          Text("2. 4 - Time Trial", style: TextStyle(fontSize: 18, color: Colors.black87)),
          Text("3. 3 - Geoguessr", style: TextStyle(fontSize: 18, color: Colors.black87)),
        ],
      ),
    );
  }
}
