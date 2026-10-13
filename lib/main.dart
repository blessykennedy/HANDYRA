import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/role_page.dart';
import 'screens/intro_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';
import 'screens/main_shell.dart';

// Provider App imports
import 'provider_app/screens/provider_dashboard.dart';
import 'provider_app/screens/booking_requests.dart';
import 'provider_app/screens/my_bookings.dart';
import 'provider_app/screens/earnings.dart';
import 'provider_app/screens/profile_screen.dart';
import 'provider_app/screens/portfolio_screen.dart';
import 'provider_app/screens/services_screen.dart';
import 'provider_app/screens/availability_screen.dart';
import 'provider_app/screens/reviews_screen.dart';
import 'provider_app/screens/chat_screen.dart';
import 'provider_app/screens/navigation_map_screen.dart';
import 'provider_app/screens/withdraw_screen.dart';
import 'provider_app/screens/transaction_detail_screen.dart';
import 'provider_app/screens/edit_profile_screen.dart';
import 'provider_app/screens/bank_details_screen.dart';
import 'provider_app/screens/verification_screen.dart';
import 'provider_app/screens/change_password_screen.dart';
import 'provider_app/screens/notifications_screen.dart';
import 'provider_app/screens/privacy_screen.dart';
import 'provider_app/screens/help_support_screen.dart';
import 'provider_app/screens/login_screen.dart';
import 'provider_app/screens/add_portfolio_screen.dart';
import 'provider_app/screens/portfolio_detail_screen.dart';
import 'provider_app/screens/booking_detail_screen.dart';
import 'provider_app/screens/service_status_screen.dart';
import 'provider_app/screens/earnings_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Handyra',
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final width = mq.size.width > 430 ? 430.0 : mq.size.width;
        return ColoredBox(
          color: const Color(0xFFE8D2C3),
          child: Center(
            child: SizedBox(
              width: width,
              child: MediaQuery(
                data: mq.copyWith(size: Size(width, mq.size.height)),
                child: child!,
              ),
            ),
          ),
        );
      },
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/role': (_) => const RolePage(),
        '/intro': (_) => const IntroPage(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const MainShell(),
        '/signup': (_) => const SignUpPage(),

        // Provider App Routes
        '/provider': (_) => const LoginScreen(),
        '/provider-dashboard': (_) => const ProviderDashboard(),
        '/requests': (_) => const BookingRequests(),
        '/provider-bookings': (_) => const MyBookings(),
        '/earnings': (_) => const Earnings(),
        '/provider-profile': (_) => const ProfileScreen(),
        '/portfolio': (_) => const PortfolioScreen(),
        '/services': (_) => const ServicesScreen(),
        '/availability': (_) => const AvailabilityScreen(),
        '/reviews': (_) => const ReviewsScreen(),
        '/chat': (_) => const ChatScreen(),
        '/map': (_) => const NavigationMapScreen(),
        '/withdraw': (_) => const WithdrawScreen(),
        '/transaction-detail': (_) => const TransactionDetailScreen(),
        '/edit-profile': (_) => const EditProfileScreen(),
        '/bank-details': (_) => const BankDetailsScreen(),
        '/verification': (_) => const VerificationScreen(),
        '/change-password': (_) => const ChangePasswordScreen(),
        '/notifications': (_) => const NotificationsScreen(),
        '/privacy': (_) => const PrivacyScreen(),
        '/help-support': (_) => const HelpSupportScreen(),
        '/provider-login': (_) => const LoginScreen(),
        '/add-portfolio': (_) => const AddPortfolioScreen(),
        '/portfolio-detail': (_) => const PortfolioDetailScreen(),
        '/booking-detail': (_) => const BookingDetailScreen(),
        '/service-status': (_) => const ServiceStatusScreen(),
        '/earnings-detail': (_) => const EarningsDetailScreen(),
      },
    );
  }
}
