import 'package:flutter/material.dart';
import '../../widgets/user_profile_widgets/profile_header.dart';
import '../../widgets/user_profile_widgets/settings_section.dart';
import '../../widgets/user_profile_widgets/device_section.dart';
import '../../widgets/user_profile_widgets/caretakers_section.dart';
import '../../widgets/user_profile_widgets/doctor_section.dart';
import '../../widgets/user_profile_widgets/footer_section.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const SizedBox(height: 16),
            const Divider(),
            const SettingsSection(),
            const SizedBox(height: 16),
            const DeviceSection(),
            const SizedBox(height: 16),
            const CaretakersSection(),
            const SizedBox(height: 16),
            const DoctorSection(),
            const SizedBox(height: 16),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
