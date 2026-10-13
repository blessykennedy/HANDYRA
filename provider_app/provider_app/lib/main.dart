import 'package:flutter/material.dart';

import 'screens/provider_dashboard.dart';
import 'screens/booking_requests.dart';
import 'screens/my_bookings.dart';
import 'screens/earnings.dart';
import 'screens/profile_screen.dart';
import 'screens/portfolio_screen.dart';
import 'screens/services_screen.dart';
import 'screens/availability_screen.dart';
import 'screens/reviews_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/navigation_map_screen.dart';
import 'screens/withdraw_screen.dart';
import 'screens/transaction_detail_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/bank_details_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/change_password_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/login_screen.dart';
import 'screens/add_portfolio_screen.dart';
import 'screens/portfolio_detail_screen.dart';
import 'screens/booking_detail_screen.dart';
import 'screens/service_status_screen.dart';
import 'screens/earnings_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider App',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const ProviderDashboard(),
        '/requests': (context) => const BookingRequests(),
        '/bookings': (context) => const MyBookings(),
        '/earnings': (context) => const Earnings(),
        '/profile': (context) => const ProfileScreen(),
        '/portfolio': (context) => const PortfolioScreen(),
        '/services': (context) => const ServicesScreen(),
        '/availability': (context) => const AvailabilityScreen(),
        '/reviews': (context) => const ReviewsScreen(),
        '/chat': (context) => const ChatScreen(),
        '/map': (context) => const NavigationMapScreen(),
        '/withdraw': (context) => const WithdrawScreen(),
        '/transaction-detail': (context) => const TransactionDetailScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/bank-details': (context) => const BankDetailsScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/help-support': (context) => const HelpSupportScreen(),
        '/login': (context) => const LoginScreen(),
        '/add-portfolio': (context) => const AddPortfolioScreen(),
        '/portfolio-detail': (context) => const PortfolioDetailScreen(),
        '/booking-detail': (context) => const BookingDetailScreen(),
        '/service-status': (context) => const ServiceStatusScreen(),
        '/earnings-detail': (context) => const EarningsDetailScreen(),
      },
    );
  }
}
