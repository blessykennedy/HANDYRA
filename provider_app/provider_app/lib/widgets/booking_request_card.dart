import 'package:flutter/material.dart';

class BookingRequestCard extends StatelessWidget {
  final String name;
  final String service;
  final String price;
  final String date;
  final String time;
  final String location;
  final String distance;
  final String description;
  final String image;

  final VoidCallback? onAccept;
  final VoidCallback? onDecline;

  const BookingRequestCard({
    super.key,
    required this.name,
    required this.service,
    required this.price,
    required this.date,
    required this.time,
    required this.location,
    required this.distance,
    required this.description,
    required this.image,
    this.onAccept,
    this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [
          // --------------------------------
          // YELLOW MESSAGE
          // --------------------------------

          Container(
            width: double.infinity,

            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),

            decoration: const BoxDecoration(
              color: Color(0xFFFFF3C9),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),

            child: const Row(
              children: [
                Text(
                  "⏰",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    "Respond within 2 hours to maintain your rating",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --------------------------------
          // CUSTOMER
          // --------------------------------

          Padding(
            padding: const EdgeInsets.fromLTRB(
              15,
              13,
              15,
              8,
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(image),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        service,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF684D3E),
                  ),
                ),
              ],
            ),
          ),

          // --------------------------------
          // DETAILS
          // --------------------------------

          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
            ),

            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),

              borderRadius: BorderRadius.circular(18),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: Column(
              children: [
                // DATE & TIME
                Row(
                  children: [
                    const Text(
                      "📅",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const Text(
                      "⏰",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // LOCATION
                Row(
                  children: [
                    const Text(
                      "📍",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const Text(
                      "🚗",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const Divider(
                  height: 15,
                ),

                // DESCRIPTION
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "💌",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(width: 7),

                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // --------------------------------
          // BUTTONS
          // --------------------------------

          if (onAccept != null || onDecline != null)
            SizedBox(
              height: 52,

              child: Row(
                children: [
                  // --------------------------------
                  // DECLINE BUTTON
                  // --------------------------------

                  if (onDecline != null)
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          _showDeclineDialog(context);
                        },

                        child: const Text(
                          "Decline",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  // DIVIDER
                  if (onDecline != null && onAccept != null)
                    Container(
                      width: 1,
                      height: 52,
                      color: Colors.redAccent,
                    ),

                  // --------------------------------
                  // ACCEPT BUTTON
                  // --------------------------------

                  if (onAccept != null)
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          _showAcceptDialog(context);
                        },

                        child: const Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ==========================================
  // DECLINE DIALOG
  // ==========================================

  void _showDeclineDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            "Decline Request",
          ),

          content: Text(
            "Are you sure you want to decline the request from $name for $service?",
          ),

          actions: [
            // CANCEL
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },

              child: const Text(
                "Cancel",
              ),
            ),

            // DECLINE
            ElevatedButton(
              onPressed: () {
                // Close ONLY the dialog
                Navigator.of(dialogContext).pop();

                // Tell BookingRequests that it was declined
                if (onDecline != null) {
                  onDecline!();
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),

              child: const Text(
                "Decline Request",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================
  // ACCEPT DIALOG
  // ==========================================

  void _showAcceptDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            "Accept Booking Request",
          ),

          content: Text(
            "Accept $service request from $name for $price on $date at $time?",
          ),

          actions: [
            // CANCEL
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },

              child: const Text(
                "Cancel",
              ),
            ),

            // ACCEPT
            ElevatedButton(
              onPressed: () {
                // Close ONLY the dialog
                Navigator.of(dialogContext).pop();

                // Tell BookingRequests that it was accepted
                if (onAccept != null) {
                  onAccept!();
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),

              child: const Text(
                "Accept Request",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}