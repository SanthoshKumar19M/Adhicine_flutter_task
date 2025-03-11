import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomDropdown extends StatelessWidget {
//   final String label;
//   final String value;
//   final List<String> items;
//   final ValueChanged<String?> onChanged; // Updated to accept nullable String

//   const CustomDropdown({
//     super.key,
//     required this.label,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         DropdownButtonFormField<String>(
//           value: value,
//           decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
//           items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
//           onChanged: onChanged, // This now properly accepts a nullable String
//         ),
//       ],
//     );
//   }
// }
