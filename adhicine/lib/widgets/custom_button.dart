import 'package:flutter/material.dart';

import '../core/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFFb3c3fe) : Color(0xFFf1f1ff), // Highlight selection
        // foregroundColor: isSelected ? Colors.white : Colors.black, // Change text color
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

// ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: isSelected ? Colors.blue : Colors.grey[300], // Highlight selection
//         foregroundColor: isSelected ? Colors.white : Colors.black, // Change text color
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//       child: Text(text, style: TextStyle(fontSize: 16)),
//     );
