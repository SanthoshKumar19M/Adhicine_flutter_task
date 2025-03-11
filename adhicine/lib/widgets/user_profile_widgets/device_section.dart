import 'package:flutter/material.dart';

class DeviceSection extends StatefulWidget {
  const DeviceSection({super.key});

  @override
  _DeviceSectionState createState() => _DeviceSectionState();
}

class _DeviceSectionState extends State<DeviceSection> {
  String _selectedOption = "sound"; // Tracks the selected item

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Device", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFeaeeff),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildListTile("Connect", "Bluetooth, Wi-Fi", Icons.wifi, "connect"),
              const SizedBox(height: 8),
              _buildListTile("Sound Option", "Ring, Silent, Vibrate", Icons.volume_down_outlined, "sound"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon, String optionKey) {
    bool isSelected = _selectedOption == optionKey;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = optionKey;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}
