import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 15),
      decoration: const BoxDecoration(
        color: Color(0xFFF4E6D8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Greeting
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good morning ☀️",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Priya",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Makeup Artist & Hair Stylist",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Notification
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  height: 38,
                  width: 38,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    size: 19,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Profile image
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa5tFWIZ4-_uugtv4iQFRIHL6UF4k9969qAeTSqD0Sn508si3w",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}