import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/booking_request_card.dart';
import '../booking_store.dart';

class BookingRequests extends StatefulWidget {
  const BookingRequests({super.key});

  @override
  State<BookingRequests> createState() => _BookingRequestsState();
}

class _BookingRequestsState extends State<BookingRequests> {
  int selectedTab = 0;

  // New booking requests
  List<Map<String, String>> newRequests = [
    {
      "name": "Daffne",
      "service": "Bridal Makeup",
      "price": "₹3,500",
      "date": "Dec 20, 2024",
      "time": "08:30AM",
      "location": "Anna nagar, Chennai",
      "distance": "3.2Km",
      "description":
      "Soft bridal look, prefer natural tones. Have skin sensitivity, please use hypoallergenic products.",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZWZqLZRb1VG-9ACte6ifehofiAJUFZr69ubkEZIdOHGAmpFlZ",
    },
    {
      "name": "Roshini",
      "service": "Party Makeup",
      "price": "₹1,200",
      "date": "Dec 22, 2024",
      "time": "05:00PM",
      "location": "Guindy, Chennai",
      "distance": "3.2Km",
      "description": "Bold party look for New Year event.",
      "image":
      "https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.jpg?s=612x612&w=0&k=20&c=tyLvtzutRh22j9GqSGI33Z4HpIwv9vL_MZw_xOE19NQ=",
    },
  ];

  // Accepted bookings
  List<Map<String, String>> acceptedRequests = [];

  // Rejected bookings
  List<Map<String, String>> rejectedRequests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                22,
              ),
              color: const Color(0xFFF4E0D2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Booking Requests",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "${newRequests.length} new requests pending",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // TABS
            Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
              ),
              child: Row(
                children: [
                  _tab(
                    title: "New",
                    count: newRequests.length.toString(),
                    index: 0,
                  ),

                  _tab(
                    title: "Accepted",
                    count: acceptedRequests.isEmpty
                        ? null
                        : acceptedRequests.length.toString(),
                    index: 1,
                  ),

                  _tab(
                    title: "Rejected",
                    count: rejectedRequests.isEmpty
                        ? null
                        : rejectedRequests.length.toString(),
                    index: 2,
                  ),
                ],
              ),
            ),

            // CONTENT
            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: const BottomNav(
        selectedIndex: 1,
      ),
    );
  }

  // TAB
  Widget _tab({
    required String title,
    required int index,
    String? count,
  }) {
    final bool selected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },

        child: Container(
          alignment: Alignment.center,

          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected
                    ? Colors.black
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected
                      ? FontWeight.bold
                      : FontWeight.w500,
                  color: selected
                      ? Colors.black
                      : Colors.grey,
                ),
              ),

              if (count != null) ...[
                const SizedBox(width: 5),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFFE7D6C8),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Text(
                    count,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // CONTENT
  Widget _buildContent() {
    // NEW
    if (selectedTab == 0) {
      if (newRequests.isEmpty) {
        return const Center(
          child: Text(
            "No new booking requests",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 20,
        ),

        itemCount: newRequests.length,

        itemBuilder: (context, index) {
          final request = newRequests[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: BookingRequestCard(
              name: request["name"]!,
              service: request["service"]!,
              price: request["price"]!,
              date: request["date"]!,
              time: request["time"]!,
              location: request["location"]!,
              distance: request["distance"]!,
              description: request["description"]!,
              image: request["image"]!,

              // ACCEPT
              onAccept: () {
                setState(() {
                  acceptedRequests.add(request);
                  newRequests.removeAt(index);
                });

                BookingStore.acceptedBookings.value = [
                  ...BookingStore.acceptedBookings.value,
                  request,
                ];

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${request["name"]} booking accepted!",
                    ),
                  ),
                );
              },

              // DECLINE
              onDecline: () {
                setState(() {
                  rejectedRequests.add(request);
                  newRequests.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "${request["name"]} booking declined.",
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    // ACCEPTED
    if (selectedTab == 1) {
      if (acceptedRequests.isEmpty) {
        return const Center(
          child: Text(
            "No accepted bookings yet",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        );
      }

      return _buildBookingList(acceptedRequests);
    }

    // REJECTED
    if (rejectedRequests.isEmpty) {
      return const Center(
        child: Text(
          "No rejected requests",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      );
    }

    return _buildBookingList(rejectedRequests);
  }

  // BUILD ACCEPTED / REJECTED LIST
  Widget _buildBookingList(
      List<Map<String, String>> requests,
      ) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 18,
        bottom: 20,
      ),

      itemCount: requests.length,

      itemBuilder: (context, index) {
        final request = requests[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: BookingRequestCard(
            name: request["name"]!,
            service: request["service"]!,
            price: request["price"]!,
            date: request["date"]!,
            time: request["time"]!,
            location: request["location"]!,
            distance: request["distance"]!,
            description: request["description"]!,
            image: request["image"]!,

            // No action needed here
            onAccept: null,
            onDecline: null,
          ),
        );
      },
    );
  }
}