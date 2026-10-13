import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'icon': Icons.star,
        'color': Colors.amber,
        'title': 'New 5-star rating from Daffne!',
        'subtitle': '"Priya is extremely skilled and patient! Loved the makeup."',
        'time': '2 hours ago',
        'read': false,
      },
      {
        'icon': Icons.account_balance_wallet,
        'color': Colors.green,
        'title': 'Payout Processed Successfully',
        'subtitle': '₹3,150 transferred to your HDFC account ****4521.',
        'time': 'Yesterday',
        'read': true,
      },
      {
        'icon': Icons.inbox,
        'color': const Color(0xFFE06C20),
        'title': 'New Booking Request from Roshini',
        'subtitle': 'Party Makeup on Dec 22, 05:00 PM at Guindy.',
        'time': '2 days ago',
        'read': true,
      },
      {
        'icon': Icons.security,
        'color': Colors.blue,
        'title': 'Profile Verification Completed',
        'subtitle': 'Your Aadhar & certificates have been verified.',
        'time': '3 days ago',
        'read': true,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4E0D2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("All notifications marked as read")),
              );
            },
            child: const Text("Mark all read", style: TextStyle(color: Color(0xFF654B3C), fontSize: 12)),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: item['read'] ? Colors.white : const Color(0xFFFFF9F3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: item['read'] ? Colors.grey.shade200 : const Color(0xFFF4E0D2)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: (item['color'] as Color).withValues(alpha: 0.15),
                    child: Icon(item['icon'] as IconData, color: item['color'] as Color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: TextStyle(
                            fontWeight: item['read'] ? FontWeight.w600 : FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['subtitle'],
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['time'],
                          style: const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
