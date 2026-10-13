import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/my_booking_card.dart';
import '../booking_store.dart';
class MyBookings extends StatefulWidget {
  const MyBookings({super.key});

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [

            // ==========================================
            // HEADER
            // ==========================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                20,
                25,
                20,
                22,
              ),
              color: const Color(0xFFF4E0D2),

              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    "My Bookings",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 3),

                  Text(
                    "Manage your service appointments",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // ==========================================
            // TABS
            // ==========================================

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

                  _buildTab(
                    "Upcoming",
                    0,
                  ),

                  _buildTab(
                    "Ongoing",
                    1,
                  ),

                  _buildTab(
                    "Completed",
                    2,
                  ),
                ],
              ),
            ),

            // ==========================================
            // BOOKING LIST
            // ==========================================

            Expanded(
              child: _buildBookings(),
            ),
          ],
        ),
      ),

      // ==========================================
      // BOTTOM NAVIGATION
      // ==========================================

      bottomNavigationBar: const BottomNav(
        selectedIndex: 2,
      ),
    );
  }

  // ==========================================
  // TAB
  // ==========================================

  Widget _buildTab(
      String title,
      int index,
      ) {
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

          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: selected
                  ? FontWeight.bold
                  : FontWeight.w500,
              color: selected
                  ? Colors.black
                  : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // BOOKINGS
  // ==========================================

  Widget _buildBookings() {
    // ==========================================
    // UPCOMING
    // ==========================================

    if (selectedTab == 0) {
      return ValueListenableBuilder<
          List<Map<String, String>>>(
        valueListenable: BookingStore.acceptedBookings,

        builder: (context, bookings, child) {
          if (bookings.isEmpty) {
            return const Center(
              child: Text(
                "No upcoming bookings",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            );
          }

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),

            itemCount: bookings.length,

            itemBuilder: (context, index) {
              final booking = bookings[index];

              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 18,
                ),

                child: MyBookingCard(
                  name: booking["name"]!,
                  service: booking["service"]!,
                  price: booking["price"]!,
                  date: booking["date"]!,
                  time: booking["time"]!,
                  location: booking["location"]!,
                  status: "upcoming",
                  image: booking["image"]!,
                ),
              );
            },
          );
        },
      );
    }

    // ==========================================
    // ONGOING
    // ==========================================

    if (selectedTab == 1) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),

        children: const [
          MyBookingCard(
            name: "Blessy",
            service: "Birthday Look",
            price: "1500",
            date: "Dec 18",
            time: "3:00pm",
            location: "Navalur",
            status: "ongoing",
            image:
            "https://i.pinimg.com/736x/82/09/3a/82093ad3d1543bd67c8279bc5dcad054.jpg",
          ),
        ],
      );
    }

    // ==========================================
    // COMPLETED
    // ==========================================

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),

      children: const [
        MyBookingCard(
          name: "Meena",
          service: "Engagement Makeup",
          price: "₹ 2,500",
          date: "Dec 10, 2024",
          time: "09:00AM",
          location: "Nungambakkam, Chennai",
          status: "completed",
          image:
          "https://i.pinimg.com/736x/8a/a0/29/8aa029fd2d996fa884bf1fcf45db55e9.jpg",
        ),
      ],
    );
  }
}