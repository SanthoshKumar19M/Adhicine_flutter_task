import 'package:adhicine/core/theme.dart';
import 'package:flutter/material.dart';

import '../network_issue_widget.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              // Navigate to Privacy Policy
            },
            child: const Text("Privacy Policy"),
          ),
          TextButton(
            onPressed: () {
              // Navigate to Terms of Use
            },
            child: const Text("Terms of Use"),
          ),
          TextButton(
            onPressed: () {
              // Rate Us action
            },
            child: const Text("Rate Us"),
          ),
          TextButton(
            onPressed: () {
              // Share action
            },
            child: const Text("Share"),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.secondaryColor, // Text color
                    side: const BorderSide(color: Color(0xFF6f8bef)), // Outline color
                  ),
                  onPressed: () {
                    // Logout logic
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => NetworkIssueWidget(),
                    // );
                  },
                  child: const Text("Log Out"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
