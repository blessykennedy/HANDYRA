import 'package:flutter/material.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_completion.dart';
import '../widgets/stats_section.dart';
import '../widgets/booking_request.dart';
import '../widgets/upcoming_bookings.dart';
import '../widgets/quick_actions.dart';
import '../widgets/rating_card.dart';
import '../widgets/bottom_nav.dart';

class ProviderDashboard extends StatefulWidget {
  const ProviderDashboard({super.key});

  @override
  State<ProviderDashboard> createState() => _ProviderDashboardState();
}

class _ProviderDashboardState extends State<ProviderDashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3EE),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Top section
              const ProfileHeader(),

              // Profile completion
              const ProfileCompletion(),

              const SizedBox(height: 10),

              // Statistics
              const StatsSection(),

              const SizedBox(height: 15),

              // New booking request
              const BookingRequest(),

              const SizedBox(height: 18),

              // Upcoming bookings
              const UpcomingBookings(),

              const SizedBox(height: 18),

              // Quick actions
              const QuickActions(),

              const SizedBox(height: 18),

              // Rating
              const RatingCard(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNav(
        selectedIndex: 0,
      ),
    );
  }
}