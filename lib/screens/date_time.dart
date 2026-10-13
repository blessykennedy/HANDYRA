import 'package:flutter/material.dart';

import '../data/provider_details.dart';
import 'booking_summary_page.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({
    super.key,
    required this.provider,
    required this.service,
  });

  final ProviderDetails provider;
  final ServiceOption service;

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  static const brown = Color(0xFF604A3C);
  static const pink = Color(0xFFF3DED0);

  int selectedDate = 0;
  int selectedTime = 0;

  final TextEditingController locationController =
  TextEditingController();

  late final List<DateTime> dates;

  final times = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
  ];

  @override
  void initState() {
    super.initState();
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    dates = List.generate(
      4,
          (index) => DateTime(
        tomorrow.year,
        tomorrow.month,
        tomorrow.day + index,
      ),
    );
  }

  DateTime get selectedDateValue {
    return dates[selectedDate];
  }

  String get selectedTimeValue {
    return times[selectedTime];
  }

  String _weekday(DateTime date) {
    const weekdays = [
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
    ];

    return weekdays[date.weekday - 1];
  }

  String _month(DateTime date) {
    const months = [
      "JAN",
      "FEB",
      "MAR",
      "APR",
      "MAY",
      "JUN",
      "JUL",
      "AUG",
      "SEP",
      "OCT",
      "NOV",
      "DEC",
    ];

    return months[date.month - 1];
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: brown,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Choose Date & Time",
          style: TextStyle(
            color: brown,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Select Date",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: brown,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 90,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,

                itemBuilder: (context, index) {
                  final isSelected = selectedDate == index;
                  final date = dates[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = index;
                      });
                    },

                    child: Container(
                      width: 75,

                      margin: const EdgeInsets.only(right: 12),

                      decoration: BoxDecoration(
                        color: isSelected ? brown : pink,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Text(
                            _weekday(date),
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            "${_month(date)} ${date.day}",
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Select Time",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: brown,
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: List.generate(
                times.length,

                    (index) {
                  final isSelected = selectedTime == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = index;
                      });
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected ? brown : pink,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Text(
                        times[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : brown,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Location",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: brown,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: locationController,

              decoration: InputDecoration(
                hintText: "Enter your location",

                filled: true,
                fillColor: pink,

                prefixIcon: const Icon(
                  Icons.location_on,
                  color: brown,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: brown,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {
                  if (locationController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please enter your location",
                        ),
                      ),
                    );

                    return;
                  }

                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => BookingSummaryPage(
                        provider: widget.provider,
                        service: widget.service,

                        selectedDate: selectedDateValue,

                        selectedTime: selectedTimeValue,

                        location:
                        locationController.text.trim(),
                      ),
                    ),
                  );
                },

                child: const Text(
                  "Continue",

                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}