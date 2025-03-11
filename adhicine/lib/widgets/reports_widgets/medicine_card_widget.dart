import 'package:flutter/material.dart';

class MedicineCardWidget extends StatelessWidget {
  final String medicineName;
  final String timing;
  final String day;
  final String status;
  final IconData icon;
  final Color color;

  const MedicineCardWidget({
    required this.medicineName,
    required this.timing,
    required this.day,
    required this.status,
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        // leading: Icon(icon, color: color, size: 32),
        leading: CircleAvatar(
          backgroundColor: Color(0xFFc1b6ff),
          radius: 30,
          child: Icon(Icons.medication_outlined, color: Colors.white, size: 32),
        ),
        title: Text(
          medicineName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$timing  •  $day"),
        trailing: Column(
          children: [
            Icon(icon, color: color, size: 32),
            Text(
              status,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
