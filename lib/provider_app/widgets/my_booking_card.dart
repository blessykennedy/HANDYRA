import 'package:flutter/material.dart';

class MyBookingCard extends StatelessWidget {
  final String name;
  final String service;
  final String price;
  final String date;
  final String time;
  final String location;
  final String status;
  final String image;

  const MyBookingCard({
    super.key,
    required this.name,
    required this.service,
    required this.price,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        children: [

          // ==========================================
          // CUSTOMER INFORMATION
          // ==========================================

          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              15,
              8,
            ),

            child: Row(
              children: [

                // Profile picture
                CircleAvatar(
                  radius: 21,
                  backgroundImage:
                  NetworkImage(image),
                ),

                const SizedBox(width: 10),

                // Name and service
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 3),

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

                // Status
                _statusBadge(),

              ],
            ),
          ),

          // ==========================================
          // DATE / TIME / LOCATION
          // ==========================================

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 58,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Row(
                  children: [

                    const Text(
                      "📅",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const Text(
                      "⏰",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 7),

                Row(
                  children: [

                    const Text(
                      "📍",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // Price
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF684D3E),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ==========================================
          // BUTTONS
          // ==========================================

          SizedBox(
            height: 45,

            child: Row(
              children: [

                Expanded(
                  child: _button(
                    context,
                    "Chat",
                        () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Chat with $name",
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text("Client: Hi Priya! I will be ready by $time."),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Type a message to $name...",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.send, color: Color(0xFF684D3E)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Message sent to $name!")),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey.shade400,
                ),

                Expanded(
                  child: _button(
                    context,
                    "Start",
                        () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Start Service"),
                          content: Text("Are you starting the $service appointment for $name at $location?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Service with $name has started!")),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              child: const Text("Start Service", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey.shade400,
                ),

                Expanded(
                  child: _button(
                    context,
                    "Map",
                        () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Navigation to $location",
                                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.navigation, color: Colors.blue),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text("Destination: $location\nEstimated time: 15 mins"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Launching turn-by-turn navigation...")),
                                    );
                                  },
                                  icon: const Icon(Icons.directions_car, color: Colors.white),
                                  label: const Text("Start Navigation", style: TextStyle(color: Colors.white)),
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
  // STATUS BADGE
  // ==========================================

  Widget _statusBadge() {

    bool completed =
        status == "completed";

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 3,
      ),

      decoration: BoxDecoration(
        color: completed
            ? const Color(0xFFC8F5C1)
            : const Color(0xFFEFE0D6),

        borderRadius:
        BorderRadius.circular(10),
      ),

      child: Text(
        completed
            ? "completed"
            : "upcoming",

        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,

          color: completed
              ? Colors.green
              : const Color(0xFF795548),
        ),
      ),
    );
  }

  // ==========================================
  // BUTTON
  // ==========================================

  Widget _button(
      BuildContext context,
      String title,
      VoidCallback onPressed,
      ) {

    return TextButton(
      onPressed: onPressed,

      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF817572),
        ),
      ),
    );
  }
}