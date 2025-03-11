import 'package:flutter/material.dart';

class DoseItem extends StatelessWidget {
  final String doseName;

  const DoseItem({super.key, required this.doseName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.access_time),
      title: Text(doseName),
      trailing: IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: () {}),
    );
  }
}
