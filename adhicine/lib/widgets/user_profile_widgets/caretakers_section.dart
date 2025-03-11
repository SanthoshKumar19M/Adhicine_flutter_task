import 'package:flutter/material.dart';

class CaretakersSection extends StatefulWidget {
  const CaretakersSection({super.key});

  @override
  _CaretakersSectionState createState() => _CaretakersSectionState();
}

class _CaretakersSectionState extends State<CaretakersSection> {
  final List<String> caretakers = ["Santhosh", "Sanjay", "Saritha"];

  void _addCaretaker() {
    setState(() {
      caretakers.add("New User ${caretakers.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Caretakers: ${caretakers.length}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFeaeeff),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // List of caretakers with avatars and names
                Expanded(
                  child: Wrap(
                    spacing: 24,
                    children: caretakers.map((name) {
                      return Column(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/images/user_default_image.png'),
                          ),
                          const SizedBox(height: 5),
                          Text(name, style: Theme.of(context).textTheme.bodySmall),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                // Add caretaker button
                Column(
                  children: [
                    InkWell(
                      onTap: _addCaretaker,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300, width: 2), // Light grey border
                        ),
                        padding: const EdgeInsets.all(8), // Padding for proper spacing
                        child: Icon(
                          Icons.add,
                          size: 45,
                          color: Colors.grey.shade400, // Light grey icon color
                        ),
                      ),
                    ),
                    const SizedBox(height: 5), // Spacing between icon and text
                    Text("Add", style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
