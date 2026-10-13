import 'package:flutter/material.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  bool instantBooking = true;
  bool emergencyBooking = false;

  final Map<String, Map<String, dynamic>> schedule = {
    'Monday': {'enabled': true, 'start': '08:00 AM', 'end': '08:00 PM'},
    'Tuesday': {'enabled': true, 'start': '08:00 AM', 'end': '08:00 PM'},
    'Wednesday': {'enabled': true, 'start': '08:00 AM', 'end': '08:00 PM'},
    'Thursday': {'enabled': true, 'start': '08:00 AM', 'end': '08:00 PM'},
    'Friday': {'enabled': true, 'start': '08:00 AM', 'end': '08:00 PM'},
    'Saturday': {'enabled': true, 'start': '08:00 AM', 'end': '09:00 PM'},
    'Sunday': {'enabled': false, 'start': '09:00 AM', 'end': '04:00 PM'},
  };

  @override
  Widget build(BuildContext context) {
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
          "Availability & Working Hours",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Instant Booking", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Allow clients to book slots automatically without prior approval", style: TextStyle(fontSize: 12)),
                      value: instantBooking,
                      activeColor: const Color(0xFFE06C20),
                      onChanged: (val) {
                        setState(() {
                          instantBooking = val;
                        });
                      },
                    ),
                    const Divider(),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Same Day Emergency Bookings", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: const Text("Accept last-minute bookings within 3 hours", style: TextStyle(fontSize: 12)),
                      value: emergencyBooking,
                      activeColor: const Color(0xFFE06C20),
                      onChanged: (val) {
                        setState(() {
                          emergencyBooking = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Weekly Schedule",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),
              ...schedule.keys.map((day) {
                final dayData = schedule[day]!;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: dayData['enabled'],
                            activeColor: const Color(0xFF654B3C),
                            onChanged: (val) {
                              setState(() {
                                dayData['enabled'] = val ?? false;
                              });
                            },
                          ),
                          Text(
                            day,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: dayData['enabled'] ? Colors.black : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      if (dayData['enabled'])
                        Text(
                          "${dayData['start']} - ${dayData['end']}",
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF654B3C)),
                        )
                      else
                        const Text(
                          "Unavailable",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Availability settings updated successfully!")),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF654B3C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Save Schedule", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
