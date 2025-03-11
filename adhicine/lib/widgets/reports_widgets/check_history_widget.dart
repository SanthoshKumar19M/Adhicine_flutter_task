import 'package:flutter/material.dart';

class CheckHistoryWidget extends StatelessWidget {
  const CheckHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Check History",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 18),
          onPressed: () {},
        ),
      ],
    );
  }
}
