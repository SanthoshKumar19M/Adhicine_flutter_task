import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  Widget _buildSettingItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      onTap: () {
        // Implement navigation or functionality
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Settings", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        _buildSettingItem(Icons.notifications_none, "Notification", "Check your medicine notification"),
        _buildSettingItem(Icons.volume_down_outlined, "Sound", "Ring, Silent, Vibrate"),
        _buildSettingItem(Icons.person_outline, "Manage Your Account", "Password, Email ID, Phone Number"),
      ],
    );
  }
}
