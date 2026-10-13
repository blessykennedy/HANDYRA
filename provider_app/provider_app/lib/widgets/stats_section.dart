import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: _StatCard(
                  icon: "📥",
                  title: "New Requests",
                  value: "6",
                  route: "/requests",
                ),
              ),

              const SizedBox(width: 9),

              Expanded(
                child: _StatCard(
                  icon: "📋",
                  title: "Upcoming",
                  value: "3",
                  route: "/bookings",
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          Row(
            children: [

              Expanded(
                child: _StatCard(
                  icon: "✅",
                  title: "Completed",
                  value: "49",
                  route: "/bookings",
                ),
              ),

              const SizedBox(width: 9),

              Expanded(
                child: _StatCard(
                  icon: "💰",
                  title: "This Month",
                  value: "₹ 28.5K",
                  route: "/earnings",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  final String route;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 78,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),

                const SizedBox(width: 5),

                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),

            Text(
              value,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF654B3C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}