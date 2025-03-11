import 'package:flutter/material.dart';

class DoctorSection extends StatelessWidget {
  const DoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Doctor",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 180, // Adjust height for better balance
                // padding: const EdgeInsets.all(14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeeff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center all content vertically
                  crossAxisAlignment: CrossAxisAlignment.center, // Center all content horizontally
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add_circle, size: 60, color: Color(0xFF6f8bef)),
                      onPressed: () {
                        // Add doctor functionality
                      },
                    ),
                    const SizedBox(height: 5),
                    Text("Add Your Doctor", style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Or use ", style: Theme.of(context).textTheme.bodySmall),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "invite link",
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.orange), // Fixed issue here
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
