import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../views/user_screens/user_profile_view.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String profileImageUrl;
  final int medicinesLeft;

  const CommonAppBar({
    Key? key,
    required this.title,
    required this.profileImageUrl,
    required this.medicinesLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.backgroundColor,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi $title!',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$medicinesLeft Medicines Left',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.medical_services, color: AppTheme.primaryColor),
          onPressed: () {
            // Handle medical kit icon tap
          },
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserProfileView()),
            );
          },
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade300, // Placeholder color
            backgroundImage: profileImageUrl.isNotEmpty ? NetworkImage(profileImageUrl) : null,
            child: profileImageUrl.isEmpty
                ? const Icon(Icons.person, color: Colors.white) // Default avatar
                : null,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
