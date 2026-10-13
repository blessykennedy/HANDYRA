import 'package:flutter/foundation.dart';

class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
  });

  final String name;
  final String email;
  final String phone;
  final String location;
}

final ValueNotifier<UserProfile> userProfile = ValueNotifier(
  const UserProfile(
    name: 'Monica',
    email: 'monica@example.com',
    phone: '+91 98765 43210',
    location: 'Velachery, Chennai',
  ),
);